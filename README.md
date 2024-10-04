# ⚠️⚠️⚠️⚠️⚠️⚠️ Archived 2024-10-04 ⚠️⚠️⚠️⚠️⚠️⚠️

This repo is now inactive.

If you're looking for the Matrix SDK packaged for React Native, you should go to https://github.com/unomed-dev/react-native-matrix-sdk instead.

---

# react-native-matrix-rust-sdk

React Native bindings for the Matrix Rust SDK

## Installation

```sh
yarn add react-native-matrix-rust-sdk@https://github.com/jhugman/react-native-matrix-rust-sdk
```

## Development

This is currently under active development while the uniffi-bindgen-react-native project solidifies.

The following command will download the `matix-rust-sdk`, build it, and generate the typescript bindings.

```sh
yarn generate
```

It will overwrite what is in the `src/generated` directory.

By default, this will use the `main` branch of the `matrix-org/matrix-rust-sdk` repo, with the `bindings/matrix-sdk-ffi` crate.

This is the equivalent of:

```sh
yarn generate \
    --force \
    --repo matrix-org/matrix-rust-sdk \
    --branch main \
    --crate bindings/matrix-sdk-ffi
```

## Usage

**This is not an example of using the SDK, just that the typescript is realistic**.

```ts
import {
  ClientBuilder,
  Client,
  CreateRoomParametersFactory,
  RoomVisibility,
  RoomPreset,
  Room,
} from 'react-native-matrix-rust-sdk';

const client: Client = await new ClientBuilder()
  .autoEnableBackups(true)
  .homeserverUrl('https://matrix.example.com')
  .build();

await client.login(
  '@username@matrix.example.com',
  'password',
  undefined,
  undefined
);

client.encryption().backupStateListener({
  onUpdate(status) {
    throw new Error('unimplemented');
  },
});

function getNamedRoom(client: Client, name: string): Room | undefined {
  return client
    .rooms()
    .find((room) => room.isPublic() && room.rawName() === name);
}

if (getNamedRoom(client, 'Demo') == undefined) {
  await client.createRoom(
    CreateRoomParametersFactory.create({
      isEncrypted: false,
      visibility: RoomVisibility.PUBLIC,
      preset: RoomPreset.PUBLIC_CHAT,
      name: 'Demo',
      topic: undefined,
      invite: undefined,
      isDirect: true,
    })
  );
}

```

### Rust and Uniffi powered

This package is generated from [the Matrix Rust SDK](https://github.com/matrix-org/matrix-rust-sdk/blob/main/bindings/matrix-sdk-ffi), by [`uniffi-bindgen-react-native`](https://github.com/jhugman/uniffi-bindgen-react-native).

## Current Status

Typescript is being generated and compiles. As the API is generated, feedback should go to either the Matrix SDK or the uniffi-bindgen-react-native projects.

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob), [`uniffi-bindgen-react-native`](https://github.com/jhugman/uniffi-bindgen-react-native) and [the Matrix Rust SDK](https://github.com/matrix-org/matrix-rust-sdk/blob/main/bindings/matrix-sdk-ffi).
