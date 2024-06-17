import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { multiply, Stringifier } from 'react-native-matrix-rust-sdk';

const stringifier = new Stringifier();
const result = stringifier.wellKnownString("React Native");

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
