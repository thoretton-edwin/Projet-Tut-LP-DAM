//
//  MainMenuViewController.h
//  IUTUnice
//
//  Created by macos on 31/01/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitrinePageViewController.h"
#import "TwitterWebViewController.h"
#import "SUAPSViewController.h"
#import "JobDatingViewController.h"
#import "AnnuaireViewController.h"
#import "UEListViewController.h"
#import "PostBacViewController.h"
#import "MapViewController.h"
#import "EDTViewController.h"
#import "SettingsViewController.h"

@interface MainMenuViewController : UIViewController <UITableViewDataSource,UITabBarDelegate>
{
    UITableView* menuTableView;
}
@property (weak, nonatomic) IBOutlet UIView *iconView1;
@property (weak, nonatomic) IBOutlet UIView *iconView2;
@property (weak, nonatomic) IBOutlet UIView *iconView3;
@property (weak, nonatomic) IBOutlet UIView *iconView4;
@property (weak, nonatomic) IBOutlet UIView *iconView5;
@property (weak, nonatomic) IBOutlet UIView *iconView6;
@property (weak, nonatomic) IBOutlet UIView *iconView7;
@property (weak, nonatomic) IBOutlet UIView *iconView8;
@property (weak, nonatomic) IBOutlet UIView *iconView9;


@property NSMutableArray* imagesViewArray;
@property NSMutableArray* imagesRefArray;
@property NSMutableArray* menuTitleArray;
@property NSMutableArray* cadreViewArray;

@property UIBarButtonItem *settings;
@property UIBarButtonItem *listMenu;

@property UIView* listViewContainer;


@property (nonatomic) IBOutlet NSString* userId;


@property BOOL isInList;



@end
