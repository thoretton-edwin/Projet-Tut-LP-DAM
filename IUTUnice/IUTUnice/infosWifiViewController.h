//
//  infosWifiViewController.h
//  IUTUnice
//
//  Created by Wazany on 20/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infosWifiViewController : UIViewController <UITableViewDataSource,UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *infoWifiTable;

@end
