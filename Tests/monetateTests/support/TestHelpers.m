//
//  TestHelpers.m
//  monetate-ios-sdkTests
//
//  Created by DJ on 8/29/18.
//  Copyright © 2018 Monetate. All rights reserved.
//

#import "TestHelpers.h"

@implementation TestHelpers

+ (TestViewController*)testViewController {
    TestViewController *controller = [[TestViewController alloc] initWithNibName:@"TestViewController"
                                                                          bundle:[NSBundle bundleForClass:[TestViewController class]]];
    [controller viewDidLoad];
    [controller view]; // The view is lazy loaded, so we need to force it to load
    
    return controller;
}

+ (TestViewController*)testViewControllerWithoutView {
    TestViewController *controller = [[TestViewController alloc] initWithNibName:@"TestViewController"
                                                                          bundle:[NSBundle bundleForClass:[TestViewController class]]];
    [controller viewDidLoad];
    
    return controller;
}

@end
