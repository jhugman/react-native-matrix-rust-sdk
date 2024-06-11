import rustModule from './NativeMatrixRustSdk';
console.log("index.tsx: About to install rust crate");
rustModule.installRustCrate(true);
console.log("index.tsx: Just installed");

export function multiply(a: number, b: number): number {
  return rustModule.multiply(a, b);
}
