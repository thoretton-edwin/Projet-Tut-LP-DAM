//
//  MapViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;
@synthesize mapSelect;
@synthesize mapText;
@synthesize campusSelect;

@synthesize nice;
@synthesize sophia;
@synthesize cannes;
@synthesize menton;
@synthesize bocca;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		CLLocationCoordinate2D annotationCoord;
		MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
		nice = [[Campus alloc]init];
		sophia = [[Campus alloc]init];
		cannes = [[Campus alloc]init];
		menton = [[Campus alloc]init];
		bocca = [[Campus alloc]init];
		
		//nice
		annotationCoord.latitude = 43.699651;
		annotationCoord.longitude = 7.229691;
		annotationPoint.coordinate = annotationCoord;
		annotationPoint.title = @"Campus Nice";
		annotationPoint.subtitle = @"IUT Nice Côte d'Azur";
		nice.infos = annotationPoint;
		
		//sophia  43.617157,7.07114
		annotationCoord.latitude = 43.617157;
		annotationCoord.longitude = 7.07114;
		annotationPoint.coordinate = annotationCoord;
		annotationPoint.title = @"Campus Sophia";
		annotationPoint.subtitle = @"IUT Sophia Antipolis";
		sophia.infos = annotationPoint;
		
		//menton 43.778035,7.500894
		annotationCoord.latitude = 43.778035;
		annotationCoord.longitude = 7.500894;
		annotationPoint.coordinate = annotationCoord;
		annotationPoint.title = @"Campus Menton";
		annotationPoint.subtitle = @"IUT Menton";
		menton.infos = annotationPoint;
		
		//Cannes 43.576411,6.968079
		annotationCoord.latitude = 43.576411;
		annotationCoord.longitude = 6.968079;
		annotationPoint.coordinate = annotationCoord;
		annotationPoint.title = @"Campus la Bocca";
		annotationPoint.subtitle = @"IUT Cannes la Bocca";
		bocca.infos = annotationPoint;
		
		
		//par default on affiche nice
		[mapView addAnnotation:nice.infos];
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	//Background design
	UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	
	// map Text design

	mapText.clipsToBounds=YES;
	mapText.layer.cornerRadius=6.0;
	mapText.layer.borderColor=[UIColor grayColor].CGColor;
	mapText.layer.borderWidth=2.0;
	mapText.contentMode = UIViewContentModeCenter;
	mapText.backgroundColor=nil;
	
	//select design
	mapSelect.clipsToBounds=YES;
	mapSelect.layer.cornerRadius=6.0;
	mapSelect.layer.borderColor=[UIColor grayColor].CGColor;
	mapSelect.layer.borderWidth=2.0;
	mapSelect.contentMode = UIViewContentModeCenter;
	mapSelect.backgroundColor=nil;
	mapSelect.tintColor = [UIColor grayColor];

	
	//select design
	campusSelect.clipsToBounds=YES;
	campusSelect.layer.cornerRadius=6.0;
	campusSelect.layer.borderColor=[UIColor grayColor].CGColor;
	campusSelect.layer.borderWidth=2.0;
	campusSelect.contentMode = UIViewContentModeCenter;
	campusSelect.backgroundColor=nil;
	campusSelect.tintColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)mapChoice:(id)sender
{
   NSLog(@"Map choice");
}
- (IBAction)campusChoice:(id)sender
{
	 NSLog(@"Campus choice");
	 
}

@end
