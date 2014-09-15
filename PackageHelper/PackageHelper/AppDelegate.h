//
//  AppDelegate.h
//  PackageHelper
//
//  Created by kcmini on 14-7-24.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQKeyboardManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic)IQKeyboardManager *keyBoardManager;
@property (strong, nonatomic) UIWindow *window;

@end
