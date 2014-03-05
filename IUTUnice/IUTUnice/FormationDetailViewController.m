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
    
    NSData *htmlData = [self.headTitle dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",self.headTitle);
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    
    NSArray *elements  = [xpathParser searchWithXPathQuery: @"//p"]; // get the page title - this is xpath notation
    TFHppleElement *element = [elements objectAtIndex:1];
    NSString *myTitle = [element text];
    
    NSLog(@"%@",myTitle);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
