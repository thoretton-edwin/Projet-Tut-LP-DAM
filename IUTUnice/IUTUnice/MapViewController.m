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
@synthesize manager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
		//location manager
		manager = [[CLLocationManager alloc] init];
		[manager setDelegate:self];
		[manager setDesiredAccuracy:kCLLocationAccuracyBest];
		//[manager startPdatingLocation];
		
		
		//init location of campus
		CLLocationCoordinate2D locNice;
		MKPointAnnotation *pointNice = [[MKPointAnnotation alloc] init];
		nice = [[Campus alloc]init];
		CLLocationCoordinate2D locSophia;
		MKPointAnnotation *pointSophia = [[MKPointAnnotation alloc] init];
		sophia = [[Campus alloc]init];
		
		CLLocationCoordinate2D locCannes;
		MKPointAnnotation *pointCannes = [[MKPointAnnotation alloc] init];
		cannes = [[Campus alloc]init];
		
		CLLocationCoordinate2D locMenton;
		MKPointAnnotation *pointMenton = [[MKPointAnnotation alloc] init];
		menton = [[Campus alloc]init];
		
		CLLocationCoordinate2D locBocca;
		MKPointAnnotation *pointBocca = [[MKPointAnnotation alloc] init];
		bocca = [[Campus alloc]init];
		
		//nice
		locNice.latitude = 43.699651;
		locNice.longitude = 7.229691;
		pointNice.coordinate = locNice;
		pointNice.title = @"Campus Nice";
		pointNice.subtitle = @"IUT Nice Côte d'Azur";
		nice.infos = pointNice;
		nice.desc=@"description a propos du campus de Nice ...";
		
		//sophia  43.617157,7.07114
		locSophia.latitude = 43.617157;
		locSophia.longitude = 7.07114;
		pointSophia.coordinate = locSophia;
		pointSophia.title = @"Campus Sophia";
		pointSophia.subtitle = @"IUT Sophia Antipolis";
		sophia.infos = pointSophia;
		sophia.desc=@"description a propos du campus de sophia ...";
		
			//cannes
		locCannes.latitude = 43.617157;
		locCannes.longitude = 7.07114;
		pointCannes.coordinate = locCannes;
		pointCannes.title = @"Campus Cannes";
		pointCannes.subtitle = @"IUT Cannes";
		cannes.infos = pointCannes;
		cannes.desc=@"description a propos du campus de cannes ...";
		
		//menton 43.778035,7.500894
		locMenton.latitude = 43.778035;
		locMenton.longitude = 7.500894;
		pointMenton.coordinate = locMenton;
		pointMenton.title = @"Campus Menton";
		pointMenton.subtitle = @"IUT Menton";
		menton.infos = pointMenton;
		menton.desc=@"description a propos du campus de menton ...";
		
		//Cannes 43.576411,6.968079
		locCannes.latitude = 43.576411;
		locCannes.longitude = 6.968079;
		pointCannes.coordinate = locCannes;
		pointCannes.title = @"Campus la Bocca";
		pointCannes.subtitle = @"IUT Cannes la Bocca";
		bocca.infos = pointCannes;
		bocca.desc=@"description a propos du campus de bocca ...";
		
		
		//par default on affiche nice
		
		
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation  {
	
	CLLocationCoordinate2D loc = [newLocation coordinate];
	//[mapView setCenterCoordiante:loc];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[mapView addAnnotation:nice.infos];
	[mapText setText:nice.desc];
	mapView.showsUserLocation = YES;
	
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
	 NSLog(@"Campus choice %d",campusSelect.selectedSegmentIndex);
	 switch(campusSelect.selectedSegmentIndex)
	{
		case 0://nice
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:nice.infos];
			
			
			[mapText setText:nice.desc];
			break;
		case 1://sophia
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:sophia.infos];
			//[mapText setText:@"%@",sophia.desc];
			break;
		case 2://canne
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:cannes.infos];
			[mapText setText:cannes.desc];
			break;
		case 3://menton
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:menton.infos];
			[mapText setText:menton.desc];
			break;
		case 4://cannes la bocca
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:bocca.infos];
			[mapText setText:bocca.desc];
			break;
	}
	 
}

@end
