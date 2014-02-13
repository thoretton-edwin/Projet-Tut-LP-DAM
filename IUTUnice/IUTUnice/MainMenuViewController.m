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

@synthesize cadreViewArray;
@synthesize iconView1;
@synthesize iconView2;
@synthesize iconView3;
@synthesize iconView4;
@synthesize iconView5;
@synthesize iconView6;
@synthesize iconView7;
@synthesize iconView8;
@synthesize iconView9;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	for (int i = 0; i < _imagesViewArray.count; i++)
	{
		UIView *cadre  = [cadreViewArray objectAtIndex:i];
		cadre.backgroundColor=nil;

	}
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	cadreViewArray =[[NSMutableArray alloc] init];
	[cadreViewArray addObject:iconView1];
	[cadreViewArray addObject:iconView2];
	[cadreViewArray addObject:iconView3];
	[cadreViewArray addObject:iconView4];
	[cadreViewArray addObject:iconView5];
	[cadreViewArray addObject:iconView6];
	[cadreViewArray addObject:iconView7];
	[cadreViewArray addObject:iconView8];
	[cadreViewArray addObject:iconView9];
	
	
	
    _imagesViewArray = [[NSMutableArray alloc] init];
	
    for(int j= 0;j<9;j++)
	{
		[_imagesViewArray addObject:[[UIImageView alloc]init]];
	}
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
		
		UIView *cadre  = [cadreViewArray objectAtIndex:i];
        UIImageView* mImv = [_imagesViewArray objectAtIndex: i];
		
			// on identifie chaque item
		
		mImv.tag = i;
        mImv.frame = CGRectMake(10,10,50,50);
			// customisation de l'imageView
		
		[cadre addSubview:mImv];
		cadre.frame = CGRectMake(0,0,70,70);
		cadre.clipsToBounds=YES;
		cadre.layer.cornerRadius=6.0;
		cadre.layer.borderColor=[UIColor grayColor].CGColor;
		cadre.layer.borderWidth=2.0;
		cadre.contentMode = UIViewContentModeCenter;
		cadre.backgroundColor=nil;

		
		// gestion des clicks
		[mImv setUserInteractionEnabled:YES];
        
        UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (singleTapping:)];
		
        [singleTap setNumberOfTapsRequired:1];
        [[_imagesViewArray objectAtIndex:i] addGestureRecognizer:singleTap];

		
        [self.view addSubview: cadre];
    }
    
    
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
				// Set vertical effect
			iconView1.backgroundColor = [UIColor grayColor];
			
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
