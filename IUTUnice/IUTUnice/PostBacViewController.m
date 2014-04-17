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
        self.title = @"Post-Bac";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //background
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:[UIScreen mainScreen].bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    // Initialization
    _accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height-65)];

    // Settings and colors
    _accordion.accordionSectionHeight = 40;
    _accordion.accordionSectionFont = [UIFont fontWithName:@"Avenir" size:16];
    _accordion.accordionSectionBorderColor = [UIColor darkGrayColor];
    _accordion.accordionSectionColor = [UIColor grayColor];
    [self.view addSubview:_accordion];
    
    // Section DUT
    [self createAndFillAccordion:@"DUT" AndSection:@"dut"];
    
    // Section LP
    [self createAndFillAccordion:@"Licence Professionelle" AndSection:@"lp"];
    
    // Section Année spé
    [self createAndFillAccordion:@"Etudiant Etranger" AndSection:@"etudiantEtranger"];
    
    // Section Etudiant étrangers
    [self createAndFillAccordion:@"Année Spéciale" AndSection:@"anneeSpeciale"];
    
}

-(void) createAndFillAccordion:(NSString*)title AndSection:(NSString*)section{
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UITextView* descr = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width ,350)];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:section ofType:@"txt"];
    NSString *text = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    descr.text = text;
    descr.backgroundColor= [UIColor clearColor];
    descr.textColor = [UIColor blackColor];
    descr.font = [UIFont systemFontOfSize:14];
    descr.editable = NO;
    descr.scrollEnabled = YES;
    [containerView addSubview:descr];
    [_accordion addSectionWithTitle:title andView:containerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
