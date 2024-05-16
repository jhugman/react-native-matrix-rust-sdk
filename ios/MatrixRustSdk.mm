#import "MatrixRustSdk.h"

namespace uniffi_generated {
    using namespace facebook::react;
    /**
    * ObjC++ class for module 'NativeMatrixRustSdk'
    */
    class JSI_EXPORT NativeMatrixRustSdkSpecJSI : public ObjCTurboModule {
    public:
        NativeMatrixRustSdkSpecJSI(const ObjCTurboModule::InitParams &params);
    };

    static facebook::jsi::Value __hostFunction_MatrixRustSdk_multiply(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
      return static_cast<ObjCTurboModule&>(turboModule).invokeObjCMethod(rt, NumberKind, "multiply", @selector(multiply:b:), args, count);
    }
    static facebook::jsi::Value __hostFunction_MatrixRustSdk_installRustCrate(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
        uint64_t rtPtr = 0;
        uint8_t a = 0;
        uint8_t result = matrixrustsdk::installRustCrate((uint64_t) rtPtr, a);
        return facebook::jsi::Value(rt, result);
    }
    static facebook::jsi::Value __hostFunction_MatrixRustSdk_cleanupRustCrate(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
        uint64_t rtPtr = 0;
        uint8_t a = 0;
        uint8_t result = matrixrustsdk::cleanupRustCrate((uint64_t) rtPtr, a);
        return facebook::jsi::Value(rt, result);
    }

    NativeMatrixRustSdkSpecJSI::NativeMatrixRustSdkSpecJSI(const ObjCTurboModule::InitParams &params)
        : ObjCTurboModule(params) {
            // Moved to constructor body
            this->methodMap_["multiply"] = MethodMetadata {2, __hostFunction_MatrixRustSdk_multiply};
            this->methodMap_["installRustCrate"] = MethodMetadata {1, __hostFunction_MatrixRustSdk_installRustCrate};
            this->methodMap_["cleanupRustCrate"] = MethodMetadata {1, __hostFunction_MatrixRustSdk_cleanupRustCrate};
    }
} // namespace uniffi_generated

@implementation MatrixRustSdk
RCT_EXPORT_MODULE()

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (NSNumber *)multiply:(double)a b:(double)b {
    NSNumber *result = @(matrixrustsdk::multiply(a, b));

    return result;
}

- (NSNumber *)installRustCrate:(bool)a {
    @throw [NSException exceptionWithName:@"UnreachableException"
                        reason:@"This method should never be called."
                        userInfo:nil];
}

- (NSNumber *)cleanupRustCrate:(bool)a {
    @throw [NSException exceptionWithName:@"UnreachableException"
                        reason:@"This method should never be called."
                        userInfo:nil];
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<uniffi_generated::NativeMatrixRustSdkSpecJSI>(params);
}
#endif

@end
