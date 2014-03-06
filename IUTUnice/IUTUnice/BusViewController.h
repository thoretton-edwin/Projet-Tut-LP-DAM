//
//  BusViewController.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 05/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCampus:(NSString*)maVille;

@property (weak, nonatomic) IBOutlet UITableView *busTableView;
@property NSMutableArray* tabBus;
@property NSString* ville;
@end
