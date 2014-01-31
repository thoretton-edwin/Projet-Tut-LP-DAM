//
//  AppDelegate.h
//  IUTUnice
//
//  Created by Wazany on 24/01/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainMenuViewController* MainMenu;
@property (strong, nonatomic) UINavigationController* navController;

@end
