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
@synthesize userLoc;

@synthesize nice;
@synthesize sophia;
@synthesize cannes;
@synthesize menton;
@synthesize bocca;
@synthesize manager;
@synthesize routeLine;
@synthesize routeLineView;
@synthesize userLocation;

@synthesize data;
@synthesize campusData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
		
		data = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mapServices" ofType:@"plist"]];
		
		
		campusData = [[NSMutableArray alloc]init];
		
		for(NSDictionary* dico in data)
		{
			Campus* item = [[Campus alloc]init];
			
			CLLocationCoordinate2D loc;
			loc.latitude = [[dico objectForKey:@"lat"]floatValue];
			loc.longitude = [[dico objectForKey:@"lon"]floatValue];
			//item.infos.coordinate =loc;
			
			MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
			point.title = [dico objectForKey:@"nom"];
			point.subtitle = [dico objectForKey:@"adresse"];
			point.coordinate=loc;
			item.infos= point;
			item.desc=[dico objectForKey:@"desc"];
			
			
			[campusData addObject:item];
			
		}
		
		
		//location manager
		manager = [[CLLocationManager alloc] init];
		[manager setDelegate:self];
		[manager setDesiredAccuracy:kCLLocationAccuracyBest];
		//[manager startPdatingLocation];
		
		mapView.delegate=self;
		
    }
    return self;
}



// MAJ position de l'utilisateur
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation  {
	
	userLoc = [newLocation coordinate];
	userLocation = mapView.userLocation;
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	mapView.delegate=self;
	
	[mapView addAnnotation:nice.infos];
	[mapText setText:nice.desc];
	mapView.showsUserLocation = YES;
	
	// center map to user location
	userLocation = mapView.userLocation;
	/*
	MKCoordinateRegion region =
	MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate,
									   50, 50);
	[mapView setRegion:region animated:YES];
	*/
	
	//Background design
	UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	
	mapView.clipsToBounds=YES;
	mapView.layer.cornerRadius=6.0;
	mapView.layer.borderColor=[UIColor grayColor].CGColor;
	mapView.layer.borderWidth=2.0;
	mapView.contentMode = UIViewContentModeCenter;
	
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

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    if(overlay == self.routeLine)
    {
        if(nil == self.routeLineView)
        {
            self.routeLineView = [[MKPolylineView alloc] initWithPolyline:self.routeLine] ;
            self.routeLineView.fillColor = [UIColor redColor];
            self.routeLineView.strokeColor = [UIColor redColor];
            self.routeLineView.lineWidth = 5;
			
        }
		
        return self.routeLineView;
    }
	
    return nil;
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
	Campus* itemSelected =[campusData objectAtIndex:campusSelect.selectedSegmentIndex];
	
	[mapView removeAnnotations:[mapView annotations]];
	NSLog(@"%f", itemSelected.infos.coordinate.latitude);
	NSLog(@"%f", itemSelected.infos.coordinate.longitude);
	[mapText setText:[[NSString alloc]initWithFormat: @"%@",itemSelected.infos.subtitle]];
	mapText.contentMode = UIViewContentModeCenter;
	mapText.textAlignment = NSTextAlignmentCenter;
	
	[mapView addAnnotation:itemSelected.infos];
	
	[mapView setCenterCoordinate:itemSelected.infos.coordinate];
	if(mapSelect.selectedSegmentIndex==0)
	{
		
		CLLocationCoordinate2D coordinateArray[2];
		coordinateArray[0] = userLocation.coordinate;
		coordinateArray[1] = itemSelected.infos.coordinate;
		
		self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
		[self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]];
		[mapView removeOverlays:mapView.overlays];
		
		
		MKDirectionsRequest *request =
		[[MKDirectionsRequest alloc] init];
		
		
		request.destination =
		[[MKMapItem alloc]initWithPlacemark:
		 [[MKPlacemark alloc]initWithCoordinate:itemSelected.infos.coordinate addressDictionary:nil]];
		
		request.source = [MKMapItem mapItemForCurrentLocation];
		
		MKDirections *directions =
		[[MKDirections alloc] initWithRequest:request];
		
		[directions calculateDirectionsWithCompletionHandler:
		 ^(MKDirectionsResponse *response, NSError *error)
		 {
			 if (error)
			 {
				 NSLog(@"erreur lors du calcul de la route;\n%@",error);
			 } else
			 {
				 
				 MKRoute *route = [response.routes objectAtIndex:0];
				 [mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
				 [mapText setText:[[NSString alloc]initWithFormat: @"%@ \n Distance: %.2f Km.",itemSelected.infos.subtitle,route.distance/1000]];
				 
				 
			 }
		 }];
	}
	
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *route = overlay;
        MKPolylineRenderer *routeRenderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        routeRenderer.strokeColor = [UIColor blueColor];
		routeRenderer.fillColor = [UIColor blackColor];
        return routeRenderer;
    }
    else return nil;
}



@end
