//
//  NotesViewController.h
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesViewController : UIViewController < OCBorghettiViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* tab;
}
@property (strong, nonatomic) OCBorghettiView *accordionN1;
@property (strong, nonatomic) OCBorghettiView *accordionN2;
@property (strong, nonatomic) OCBorghettiView *accordionN3;

@end
