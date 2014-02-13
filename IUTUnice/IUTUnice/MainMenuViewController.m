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
    [_imagesRefArray addObject: [UIImage imageNamed:@"Twitter_logo_blue.png"]];
    
    for (int i = 0; i < _imagesViewArray.count; i++) {
        [[_imagesViewArray objectAtIndex:i] setImage: [_imagesRefArray objectAtIndex:i]];
        UIImageView* mImv = [_imagesViewArray objectAtIndex: i];
        
			//custom border and bounds rect
		mImv.clipsToBounds=YES;
		mImv.layer.cornerRadius=6.0;
		mImv.layer.borderColor=[UIColor grayColor].CGColor;
		mImv.layer.borderWidth=2.0;

		
        [mImv setUserInteractionEnabled:YES];
        mImv.tag = i;
        UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (singleTapping:)];
        [singleTap setNumberOfTapsRequired:1];
        [[_imagesViewArray objectAtIndex:i] addGestureRecognizer:singleTap];
        
        mImv.frame = CGRectMake(0, 0, 64, 64);
        mImv.center = mImv.superview.center;
        [self.view addSubview: mImv];
    }
    
    /*UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(theEditMethod:)];
    [self.navigationItem setLeftBarButtonItem:leftBarButton animated:NO];*/
    
    /*UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(theAddMethod:)];
    [self.navigationItem setRightBarButtonItem:rightBarButton animated:NO];*/
    
    UIImage* imageSettings = [UIImage imageNamed:@"settings-24-512.png"];
    CGRect rect = CGRectMake(0,0,32,32);
    UIGraphicsBeginImageContext( rect.size );
    [imageSettings drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    
    UIBarButtonItem* settings = [[UIBarButtonItem alloc] initWithImage:img style: UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setLeftBarButtonItem:settings animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)singleTapping:(id)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"image click N°:%ld",(long)gesture.view.tag);
    
    switch((long)gesture.view.tag)
    {
        case 0: // Page Vitrine
        {
            VitrinePageViewController *viewController = [[VitrinePageViewController alloc] initWithNibName:@"VitrinePageViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 1: // Post Bac
            break;
        case 2: // Notes
            break;
        case 3: // EDT
            break;
        case 4: // Annuaire
            break;
        case 5: // Job Dating
            break;
        case 6: // Map
            break;
        case 7: // SUAPS
            break;
        case 8: // Twitter
            break;
        default:
            // lancer une exception ? ..
            break;
            
    }
    
    
}

@end
