//
//  RenseignementTableViewController.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 04/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface RenseignementTableViewController : UITableViewController
<MFMailComposeViewControllerDelegate>
@property MFMailComposeViewController* mailView;
@end
