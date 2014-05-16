//
//  FormationDetailViewController.h
//  IUTUnice
//
//  Created by VM Mac on 21/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormationDetailViewController : UIViewController <UIWebViewDelegate>

@property NSString* htmlBody;
@property UIWebView* webView;

@end
