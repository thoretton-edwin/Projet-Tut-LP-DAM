//
//  FormationListViewController.h
//  IUTUnice
//
//  Created by VM Mac on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Formation.h"

@interface FormationListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    UITableView *tableView;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *mDegreeSelector;
@property (weak, nonatomic) IBOutlet UISearchBar *mSearchBar;
@property NSMutableArray *mFormationArray;

@end
