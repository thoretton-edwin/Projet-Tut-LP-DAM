//
//  ConnexionViewController.h
//  IUTUnice
//
//  Created by Wazany on 27/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnexionViewController : UIViewController

- (IBAction)goToLogin:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *mPassword;
@property (strong, nonatomic) IBOutlet UITextField *mUsername;

@end
