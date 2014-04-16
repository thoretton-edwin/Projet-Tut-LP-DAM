//
//  SettingsViewController.h
//  IUTUnice
//
//  Created by VM Mac on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnexionViewController.h"
#import "infosWifiTableViewController.h"
#import "AboutViewController.h"
#import "SondageViewController.h"
#import "LangueViewController.h"
#import "CreditsViewController.h"
#import "Reachability.h"

@interface SettingsViewController : UITableViewController
{
    NSMutableArray *tabSettings, *tabInfosWifi;
    
}

@property (nonatomic) IBOutlet NSString* userId;

@end
