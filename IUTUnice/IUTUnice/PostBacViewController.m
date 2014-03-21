//
//  PostBacViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "PostBacViewController.h"

@interface PostBacViewController ()

@end

@implementation PostBacViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    // Initialization
    OCBorghettiView *accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height-80)];
    
    // Settings and colors
    accordion.accordionSectionHeight = 40;
    accordion.accordionSectionFont = [UIFont fontWithName:@"Avenir" size:16];
    accordion.accordionSectionBorderColor = [UIColor darkGrayColor];
    accordion.accordionSectionColor = [UIColor grayColor];
    
    
    [self.view addSubview:accordion];
    
    // Section One
    UIView *sectionOne = [[UIView alloc] init];
    UITextView* text = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, sectionOne.frame.size.width, 30)];
    text.text = @"Test";
    
    [sectionOne addSubview:text];
    [accordion addSectionWithTitle:@"Section One"
                           andView:sectionOne];
    
    // Section Two
    UIView *sectionTwo = [[UIView alloc] init];
    [accordion addSectionWithTitle:@"Section Two"
                           andView:sectionTwo];
    
    // Section Three
    UIView *sectionThree = [[UIView alloc] init];
    [accordion addSectionWithTitle:@"Section Three"
                           andView:sectionThree];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
