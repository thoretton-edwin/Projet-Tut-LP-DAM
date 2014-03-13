//
//  EDTTabViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 13/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "EDTTabViewController.h"

@interface EDTTabViewController ()

@end

@implementation EDTTabViewController
@synthesize dayView;
@synthesize weekView;

-(id)init
{
	self = [super init];
    if (self) {
        

    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	/*
	weekView =[[WeekViewController alloc]init];
	dayView= [[DayViewController alloc]init];
	
	NSLog(@"View did load...");
	self.viewControllers =[NSArray arrayWithObjects: weekView, dayView, nil];
	self.selectedIndex=0;
	
	UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"Semaine" image:nil tag:0];
	UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"Jour" image:nil tag:0];
	
	
	[weekView setTabBarItem:item1];
	[dayView setTabBarItem:item2];
	*/
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
