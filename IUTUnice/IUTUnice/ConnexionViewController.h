//
//  ConnexionViewController.h
//  IUTUnice
//
//  Created by Wazany on 21/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnexionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *motsdepasse;
- (IBAction)GoToLogin:(id)sender;

@end
