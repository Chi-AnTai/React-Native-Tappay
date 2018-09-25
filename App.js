import React from 'react';
import { StyleSheet, Text, View,NativeModules } from 'react-native';
import ExampleBridgeView from './ExampleBridgeNativeView';
var ExampleBridgeManager = NativeModules.ExampleBridgeManager;

export default class App extends React.Component {
    constructor(props){
        super(props)
        this.state = {response:null}
    }
  render() {
    return (
      <View style={styles.container}>
        <ExampleBridgeView style={{width:300,height:100}}/>
        <Text style={{padding:10,borderWidth:1,borderColor:'gray'}}
            onPress={()=>{
                var events = ExampleBridgeManager.getPrime();
                events.then(res=>{
                    console.log('react native get ios prime',res);
                    this.setState({response:res})
                }).catch(error=>{
                    this.setState({response:error.toString()})
                });
            }}
        >Get Prime!</Text>
        <Text style={{marginTop:10}}>{this.state.response}</Text>
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
