// Generated by uniffi-bindgen-react-native
import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  // TODO Remove `multiply` after seeing this work on iOS and Android.
  multiply(a: number, b: number): number;
  installRustCrate(runtime: boolean): boolean;
  cleanupRustCrate(runtime: boolean): boolean;
}

export default TurboModuleRegistry.getEnforcing<Spec>('MatrixRustSdk');