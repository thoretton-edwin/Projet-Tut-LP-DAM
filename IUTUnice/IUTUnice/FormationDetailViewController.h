//
//  FormationDetailViewController.h
//  IUTUnice
//
//  Created by VM Mac on 21/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFHpple.h"
#import "TFHppleElement.h"
#import "XPathQuery.h"
#import "OCBorghettiView.h"

@interface FormationDetailViewController : UIViewController <OCBorghettiViewDelegate>

@property NSString* headTitle;
@property OCBorghettiView *accordion;

@end
