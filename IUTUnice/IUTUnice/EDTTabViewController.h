//
//  EDTTabViewController.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 13/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayViewController.h"
#import "WeekViewController.h"
@interface EDTTabViewController : UITabBarController
@property WeekViewController *weekView;
@property DayViewController *dayView;

-(id)init;
@end
