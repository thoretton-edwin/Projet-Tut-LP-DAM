//
//  MainMenuViewController.m
//  IUTUnice
//
//  Created by macos on 31/01/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
    _imagesViewArray = [[NSMutableArray alloc] init];
    [_imagesViewArray addObject: mImageVitrine];
    [_imagesViewArray addObject: mImageCalendar];
    [_imagesViewArray addObject: mImageMarks];
    [_imagesViewArray addObject: mImagePostBac];
    [_imagesViewArray addObject: mImageAnnuaire];
    [_imagesViewArray addObject: mImageJobDating];
    [_imagesViewArray addObject: mImageMap];
    [_imagesViewArray addObject: mImageSUAPS];
    [_imagesViewArray addObject: mImageTwitter];
    
    _imagesRefArray = [[NSMutableArray alloc] init];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836131_Library.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836124_college_3D.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836370_Test-paper-128.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836150_calendar.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836248_addressbook.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836301_Manager.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836200_map-icon.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836168_Soccer_Ball.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"twitter-button-05.jpg"]];
    
    for (int i = 0; i < _imagesViewArray.count; i++) {
        [[_imagesViewArray objectAtIndex:i] setImage: [_imagesRefArray objectAtIndex:i]];
        UIImageView* mImv = [_imagesViewArray objectAtIndex: i];
        mImv.frame = CGRectMake(0, 0, 64, 64);
        mImv.center = mImv.superview.center;
        [self.view addSubview: mImv];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
