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
    NSData *htmlData = [self.headTitle dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *elements  = [xpathParser searchWithXPathQuery:@"//h3"]; // get the page title - this is xpath notation
    TFHppleElement *element = [elements objectAtIndex:0];
    NSString *myTitle = [element content];
    NSLog(@"%@",myTitle);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
