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
#import "Reachability.h"

@interface MainMenuViewController : UIViewController <UITableViewDataSource,UITabBarDelegate>
{
    UITableView* menuTableView;
}
@property (strong, nonatomic)  UIView *iconView1;
@property (strong, nonatomic)  UIView *iconView2;
@property (strong, nonatomic)  UIView *iconView3;
@property (strong, nonatomic)  UIView *iconView4;
@property (strong, nonatomic)  UIView *iconView5;
@property (strong, nonatomic)  UIView *iconView6;
@property (strong, nonatomic)  UIView *iconView7;
@property (strong, nonatomic)  UIView *iconView8;
@property (strong, nonatomic)  UIView *iconView9;


@property NSMutableArray* imagesViewArray;
@property NSMutableArray* imagesRefArray;
@property NSMutableArray* menuTitleArray;
@property NSMutableArray* cadreViewArray;

@property UIBarButtonItem *settings;
@property UIBarButtonItem *listMenu;

@property UIView* listViewContainer;

@property int tagInfo;


@property (nonatomic) IBOutlet NSString* userId;


@property BOOL isInList;



@end
