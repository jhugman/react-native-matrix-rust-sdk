#include "react-native-matrix-rust-sdk.h"
#include "generated/rondpoint.hpp"

#include <android/log.h>

#define LOG_TAG "MyRondpointApp"

#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)__android_log_print(ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__))

namespace matrixrustsdk {
	using namespace facebook;
	double multiply(double a, double b) {
		return a * b;
	}

	uint8_t installRustCrate(jsi::Runtime &runtime, uint8_t b) {
		LOGI("About to try and install NativeRondpoint");
		NativeRondpoint::registerModule(runtime);
		LOGI("Installed Rondpoint");
		return false;
	}

	uint8_t cleanupRustCrate(jsi::Runtime &runtime, uint8_t b) {
		return false;
	}
}
