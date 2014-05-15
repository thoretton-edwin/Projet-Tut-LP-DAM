//
//  FormationListViewController.h
//  IUTUnice
//
//  Created by VM Mac on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Formation.h"
#import "FormationDetailViewController.h"

@interface FormationListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>{
    UITableView *tableView;
}

@property (nonatomic) IBOutlet UISegmentedControl *mDegreeSelector;
//@property (weak, nonatomic) IBOutlet UISearchBar *mSearchBar;
@property NSMutableArray *mFormationArray ,*mDisplayedArray, *mFilteredArray;

@property NSDictionary* formation;

@end
