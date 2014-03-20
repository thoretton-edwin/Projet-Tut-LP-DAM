//
//  NotesViewController.h
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "Module.h"
#import "UE.h"
#import "Semestre.h"

@interface UEListViewController : UIViewController < OCBorghettiViewDelegate,UITableViewDelegate,UITableViewDataSource,UITableViewDataSource>
@property NSArray* bulletin;


@end
