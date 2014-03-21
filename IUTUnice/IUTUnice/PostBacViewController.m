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
    OCBorghettiView *accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height-65)];
    
    // Settings and colors
    accordion.accordionSectionHeight = 40;
    accordion.accordionSectionFont = [UIFont fontWithName:@"Avenir" size:16];
    accordion.accordionSectionBorderColor = [UIColor darkGrayColor];
    accordion.accordionSectionColor = [UIColor grayColor];
    
    
    [self.view addSubview:accordion];
    
    // Section DUT
    UIView *DUT = [[UIView alloc] init];
    UIView *vuesDUT = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UITextView* dutdescr = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    //
    
    dutdescr.text = @"Test";
    dutdescr.backgroundColor= [UIColor clearColor];
    [vuesDUT addSubview:dutdescr];
    
    [DUT addSubview:vuesDUT];
    [accordion addSectionWithTitle:@"DUT"
                           andView:DUT];
    
    // Section LP
    UIView *lp = [[UIView alloc] init];
    
    UIView *vuesLP = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UITextView* lpDescr = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    
    lpDescr.text = @"Test";
    lpDescr.backgroundColor= [UIColor clearColor];
    
    [vuesLP addSubview:lpDescr];
    
    [lp addSubview:vuesLP];
    
    
    [accordion addSectionWithTitle:@"LP"
                           andView:lp];
    
    // Section Année spé
    UIView *anneeSpe = [[UIView alloc] init];
    
    
    UIView *vuesAS = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UITextView* ASDescr = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    ASDescr.text = @"Test";
    ASDescr.backgroundColor= [UIColor clearColor];
    
    [vuesAS addSubview:ASDescr];
    
    [anneeSpe addSubview:vuesAS];
    
    
    
    [accordion addSectionWithTitle:@"Année spécial"
                           andView:anneeSpe];
    
    // Section Etudiant étrangers
    UIView *etudiantEtr = [[UIView alloc] init];
    
    UIView *vuesEE = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UITextView* EEDescr = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    
    EEDescr.text = @"Test";
    EEDescr.backgroundColor= [UIColor clearColor];
    
    [vuesEE addSubview:EEDescr];
    
    [etudiantEtr addSubview:vuesEE];
    
    
    [accordion addSectionWithTitle:@"Etudiant étrangers"
                           andView:etudiantEtr];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
