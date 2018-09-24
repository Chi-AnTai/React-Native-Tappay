//  Created by react-native-create-bridge

import React, { Component } from 'react'
import { requireNativeComponent } from 'react-native'

const ExampleBridge = requireNativeComponent('ExampleBridge', ExampleBridgeView)

export default class ExampleBridgeView extends Component {
  render () {
    return <ExampleBridge {...this.props} />
  }
}

// ExampleBridgeView.propTypes = {
//   exampleProp: React.PropTypes.string
// }
