//
//  CreditsViewController.m
//  IUTUnice
//
//  Created by Wazany on 27/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Crédits";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _crew.text= @"Responsable Développement:\n\tRIVAS Guillaume  \n\nDéveloppeurs: \n\tPALOULACK Maxime \n\tTHORETTON Edwin";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
