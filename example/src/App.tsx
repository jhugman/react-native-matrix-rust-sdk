import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import * as matrix from 'react-native-matrix-rust-sdk';

// const client = await new ClientBuilder()
//                 .homeserverUrl("https://localhost:8008")
//                 .userAgent("golden-eye/007")
//                 .build();
// const result = 34;
const result = matrix.matrixToUserPermalink("@jplatte:notareal.hs");
new matrix.ClientBuilder()
  .username("@jhugman:matrix.org")
  .passphrase("james+element@hugman.tv")
  .build()
  .then(client => {
    console.log("client", client.deviceId());
  })
  .catch(err => {
     console.log("err", err);
   });

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
