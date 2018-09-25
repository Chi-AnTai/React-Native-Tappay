//  Created by react-native-create-bridge

// import UIKit so you can subclass off UIView
#import <UIKit/UIKit.h>
#import <TPDirect/TPDirect.h>
@class RCTEventDispatcher;

@interface ExampleBridge : UIView
  // Define view properties here with @property
  @property (nonatomic, assign) NSString *exampleProp;
  @property (strong, nonatomic) TPDForm *tpdForm;
  @property (strong, nonatomic) TPDCard *tpdCard;
  @property Boolean cardIsValidate;
  // Initializing with the event dispatcher allows us to communicate with JS
  - (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end
