//
//  FormationDetailViewController.m
//  IUTUnice
//
//  Created by VM Mac on 21/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "FormationDetailViewController.h"

@interface FormationDetailViewController ()

@end

@implementation FormationDetailViewController

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
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    // Initialization
    _accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0,64,self.view.frame.size.width,344)];
    
    // Settings and colors
    _accordion.accordionSectionHeight = 40;
    _accordion.accordionSectionFont = [UIFont fontWithName:@"Avenir" size:16];
    _accordion.accordionSectionBorderColor = [UIColor darkGrayColor];
    _accordion.accordionSectionColor = [UIColor grayColor];
    [self.view addSubview:_accordion];
    
    //Parsing HTML
    NSData *htmlData = [self.headTitle dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",self.headTitle);
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *elements  = [xpathParser searchWithXPathQuery: @"//h2"];
    
    for (TFHppleElement *elmt in elements) {
        //TFHppleElement *element = [elements objectAtIndex:n];
        NSLog(@"%@",[elmt text]);
        if ([[elmt text]  isEqual: @"\n\tLes enseignements et le stage\n"]){
            [self createSectionWithString:@"Les Enseignements et le Stage"];
        }
        if ([[elmt text]  isEqual: @"\n\tPrésentation de la formation\n"]){
            [self createSectionWithString:@"Présentation de la formation"];
        }
        if ([[elmt text]  isEqual: @"\n\tPrésentation\n"]){
            [self createSectionWithString:@"Présentation"];
        }
        
        if ([[elmt text]  isEqual: @"\n\tLes métiers\n"] || [[elmt text]  isEqual: @"\n\tLes métiers\u00a0\n"]){
            [self createSectionWithString:@"Les Métiers"];
        }
        if ([[elmt text]  isEqual: @"\n\t​Après le DU\n"]){
            [self createSectionWithString:@"​Après le DU"];
        }
        if ([[elmt text]  isEqual: @"\n\t​Après la licence professionnelle\n"]){
            [self createSectionWithString:@"​Après la Licence Professionnelle"];
        }
        if ([[elmt text]  isEqual: @"\n\tAprès le DUT\u00a0\n"] || [[elmt text]  isEqual: @"\n\tAprès le DUT\n"] ){
            [self createSectionWithString:@"​Après le DUT"];
        }
        
        if ([[elmt text]  isEqual: @"\n\tPoursuite d’études\u00a0\n"] || [[elmt text]  isEqual: @"\n\tPoursuite d’études\n"]){
            [self createSectionWithString:@"Poursuite d’Etudes"];
        }
        
        
        if ([[elmt text]  isEqual: @"\n\tLes profils requis\n"]){
            [self createSectionWithString:@"Les Profils Requis"];
        }
        if ([[elmt text]  isEqual: @"\n\tLes plus de la formation\u00a0\n"]){
            [self createSectionWithString:@"​Les Plus de la Formation"];
        }
        if ([[elmt text]  isEqual: @"\n\tLe plus de la formation\n"]){
            [self createSectionWithString:@"​Les Plus de la Formation"];
        }
        if ([[elmt text]  isEqual: @"\n\tLes plus de la formation\n"]){
            [self createSectionWithString:@"​Les Plus de la Formation"];
        }
        
        if ([[elmt text]  isEqual: @"\n\tLe semestre décalé\n"]){
            [self createSectionWithString:@"​Le Semestre Décalé"];
        }
        
        if ([[elmt text]  isEqual: @"\n\tLes contacts\n"]){
            [self createSectionWithString:@"Les Contacts"];
        }
        
    }
    
    /*TFHppleElement *element = [elements objectAtIndex:1];
    NSString *myTitle = [element text];
    NSLog(@"%@",myTitle);*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createSectionWithString: (NSString*) title{
    UIView *sectionOne = [[UIView alloc] init];
    [sectionOne setBackgroundColor:[UIColor clearColor]];
    [_accordion addSectionWithTitle:title andView:sectionOne];
}

@end
