//  Created by react-native-create-bridge

#import <Foundation/Foundation.h>
#import "ExampleBridge.h"
#import "ExampleBridgeManager.h"

// import RCTBridge
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#elif __has_include(“RCTBridge.h”)
#import “RCTBridge.h”
#else
#import “React/RCTBridge.h” // Required when used as a Pod in a Swift project
#endif
@interface ExampleBridgeManager ()
@property (strong, nonatomic) ExampleBridge *tappayView;

@end
@implementation ExampleBridgeManager

@synthesize bridge = _bridge;

// Export a native module
// https://facebook.github.io/react-native/docs/native-modules-ios.html
RCT_EXPORT_MODULE();

// Return the native view that represents your React component
- (UIView *)view
{
  return self.tappayView;
}

- (instancetype)init {
  if (self = [super init]) {
    // Initialize self
  }
  self.tappayView = [[ExampleBridge alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
  return self;
}

RCT_REMAP_METHOD(getPrime,
                 findEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  if(self.tappayView.cardIsValidate) {
    [[[self.tappayView.tpdCard onSuccessCallback:^(NSString * _Nullable prime, TPDCardInfo * _Nullable cardInfo) {
      NSLog(@"ios get prime");
      
      resolve(prime);
    }] onFailureCallback:^(NSInteger status, NSString * _Nonnull message) {
      NSLog(@"ios fail");
      
      NSError *error = nil;
      reject(@"code", message, error);
      
    }] getPrime];
  } else {
    NSError *error = nil;
    reject(@"no_events", @"card is not validate", error);
  }
}

RCT_EXPORT_VIEW_PROPERTY(exampleProp, NSString)

// Export constants
// https://facebook.github.io/react-native/releases/next/docs/native-modules-ios.html#exporting-constants
- (NSDictionary *)constantsToExport
{
  return @{
           @"EXAMPLE": @"example"
         };
}

@end
