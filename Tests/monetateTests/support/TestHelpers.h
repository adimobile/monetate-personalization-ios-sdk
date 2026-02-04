//
//  TestHelpers.h
//  monetate-ios-sdkTests
//
//  Created by DJ on 8/29/18.
//  Copyright © 2018 Monetate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestViewController.h"

@interface TestHelpers : NSObject

+ (TestViewController*)testViewController;
+ (TestViewController*)testViewControllerWithoutView;

@end
