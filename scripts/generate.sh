#!/bin/bash
set -e
ROOT=$(dirname "$0")/..
ROOT=$(cd "$ROOT" && pwd)

UBRN_BIN="$ROOT/node_modules/.bin/uniffi-bindgen-react-native"
CONFIG="$ROOT/rondpoint.yaml"
MODULES=("rondpoint")

# Checkout the rondpoint crate from git
"$UBRN_BIN" checkout --config "$CONFIG" 2>/dev/null || echo "Already checked out"
# Build using cargo ndk
"$UBRN_BIN" build android --config "$CONFIG"
"$UBRN_BIN" build ios     --config "$CONFIG"

# Build using cargo build, then xcodebuild -create-framework.
# Not using lipo yet; also, fails because rondpoint doesn't use `staticlib` yet.
# "$UBRN_BIN" build ios --config "$CONFIG"

# Now generate the typescript and cpp.
# This should be done by $UBRN_BIN, and derive these from the $CONFIG file.
REPO_DIR="$ROOT/rust_modules/uniffi-bindgen-react-native"
LIB_FILE="$REPO_DIR/target/aarch64-linux-android/debug/libuniffi_rondpoint.a"

pushd "${REPO_DIR}" > /dev/null || exit 1
"$UBRN_BIN" \
    generate \
    bindings \
    --library \
    --ts-dir "$ROOT/src/generated" \
    --cpp-dir "$ROOT/cpp/generated" \
    "$LIB_FILE"
popd >/dev/null || exit 1

"$UBRN_BIN" \
    generate \
    turbo-module \
    --config "${CONFIG}" \
    "${MODULES[@]}"

# Prepare the typescript into javascript. This should be done during the install step.
UBRN="$ROOT/node_modules/uniffi-bindgen-react-native"
(cd "$UBRN" && ../.bin/tsc)

(cd example/ios && pod install)

echo "Done! Now build with yarn example start!"
