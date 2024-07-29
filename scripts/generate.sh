#!/bin/bash
set -e
ROOT=$(dirname "$0")/..
ROOT=$(cd "$ROOT" && pwd)

UBRN_BIN="$ROOT/node_modules/.bin/uniffi-bindgen-react-native"
CONFIG="$ROOT/matrix-sdk.yaml"

# Checkout the rondpoint crate from git
"$UBRN_BIN" checkout --config "$CONFIG" 2>/dev/null || echo "Already checked out"
# Build using cargo ndk
"$UBRN_BIN" build android --config "$CONFIG"
"$UBRN_BIN" build ios     --config "$CONFIG" --and-generate

# Prepare the typescript into javascript. This should be done during the install step.
UBRN="$ROOT/node_modules/uniffi-bindgen-react-native"
(cd "$UBRN" && ../.bin/tsc)

(cd example/ios && pod install)

echo "Done! Now build with yarn example start!"
