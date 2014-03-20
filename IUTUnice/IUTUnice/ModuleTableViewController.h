//
//  ModuleListTableViewController.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 20/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Module.h"
@interface ModuleTableViewController : UITableViewController
@property Module* module;


- (id)initWithStyle:(UITableViewStyle)style andModule:(Module*)mod;
@end
