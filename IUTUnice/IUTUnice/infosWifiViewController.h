//
//  infosWifiViewController.h
//  IUTUnice
//
//  Created by Wazany on 21/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "infosWifi.h"

@interface infosWifiViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITableView *infosWifiTableView;
@property NSMutableArray* tabInfosWifi;


@end
