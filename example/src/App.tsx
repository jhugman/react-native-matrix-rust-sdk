import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { multiply, copieDictionnaire, DictionnaireFactory, Enumeration } from 'react-native-matrix-rust-sdk';

const result = multiply(3, 7);

copieDictionnaire(DictionnaireFactory.create({
  un: Enumeration.TROIS,
  deux: false,
  petitNombre: 42,
  grosNombre: 42n,
}));

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
