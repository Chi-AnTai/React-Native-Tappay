import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import ExampleBridgeView from './ExampleBridgeNativeView';
export default class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Open up App.js to start working on your app!</Text>
        <ExampleBridgeView style={{width:100,height:100}}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
