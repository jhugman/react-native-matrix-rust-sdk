// Generated by uniffi-bindgen-react-native
#include "react-native-matrix-rust-sdk.h"
#include "generated/rondpoint.hpp"

namespace matrixrustsdk {
	using namespace facebook;
	double multiply(double a, double b) {
		return a * b;
	}

	uint8_t installRustCrate(jsi::Runtime &runtime, uint8_t b) {
		NativeRondpoint::registerModule(runtime);
		return false;
	}

	uint8_t cleanupRustCrate(jsi::Runtime &runtime, uint8_t b) {
		return false;
	}
}