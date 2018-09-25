//  Created by react-native-create-bridge
#import <Foundation/Foundation.h>
#import "ExampleBridge.h"

// import RCTEventDispatcher
#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include(“RCTEventDispatcher.h”)
#import “RCTEventDispatcher.h”
#else
#import “React/RCTEventDispatcher.h” // Required when used as a Pod in a Swift project
#endif


@implementation ExampleBridge : UIView  {

  RCTEventDispatcher *_eventDispatcher;
  UIView *childView;

}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
  if ((self = [super init])) {
    _eventDispatcher = eventDispatcher;
    childView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    self.tpdForm = [TPDForm setupWithContainer:childView];
    self.tpdCard = [TPDCard setup:(self.tpdForm)];
  }
  [self.tpdForm onFormUpdated:^(TPDStatus * _Nonnull status) {
    self.cardIsValidate = [status isCanGetPrime];
    NSLog(@"on Form Update");
    NSLog(self.cardIsValidate ? @"Yes" : @"No");

  }];
    
  return self;
}
-(void)layoutSubviews
{
  [super layoutSubviews];
  childView.frame = self.bounds;
  [self addSubview:childView];
  
}

@end
