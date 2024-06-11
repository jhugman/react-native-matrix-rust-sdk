#ifndef MATRIXRUSTSDK_H
#define MATRIXRUSTSDK_H
#include <cstdint>
#include <jsi/jsi.h>
#include <ReactCommon/CallInvoker.h>

namespace matrixrustsdk {
  using namespace facebook;

  double multiply(double a, double b);
  uint8_t installRustCrate(jsi::Runtime &runtime, uint8_t b);
  uint8_t cleanupRustCrate(jsi::Runtime &runtime, uint8_t b);
}

#endif /* MATRIXRUSTSDK_H */
