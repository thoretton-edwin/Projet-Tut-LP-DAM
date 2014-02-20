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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
		//location manager
		manager = [[CLLocationManager alloc] init];
		[manager setDelegate:self];
		[manager setDesiredAccuracy:kCLLocationAccuracyBest];
		//[manager startPdatingLocation];
		
		mapView.delegate=self;
		
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
		locBocca.latitude = 43.576411;
		locBocca.longitude = 6.968079;
		pointBocca.coordinate = locBocca;
		pointBocca.title = @"Campus la Bocca";
		pointBocca.subtitle = @"IUT Cannes la Bocca";
		bocca.infos = pointCannes;
		bocca.desc=@"description a propos du campus de bocca ...";
		

		
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
	 NSLog(@"Campus choice %ld",(long)campusSelect.selectedSegmentIndex);

	 switch(campusSelect.selectedSegmentIndex)
	{
		case 0://nice
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:nice.infos];
			
			
			[mapView setCenterCoordinate:nice.infos.coordinate];
			[mapText setText:nice.desc];
			
			if(mapSelect.selectedSegmentIndex==0)
			{
				
				CLLocationCoordinate2D coordinateArray[2];
				coordinateArray[0] = userLocation.coordinate;
				coordinateArray[1] = nice.infos.coordinate;
				
				
				self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
				[self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]];
				[mapView removeOverlays:mapView.overlays];

				
				MKDirectionsRequest *request =
				[[MKDirectionsRequest alloc] init];
				
				
				request.destination =
					[[MKMapItem alloc]initWithPlacemark:
					[[MKPlacemark alloc]initWithCoordinate:nice.infos.coordinate addressDictionary:nil]];
			
				request.source = [MKMapItem mapItemForCurrentLocation];
				
				MKDirections *directions =
					[[MKDirections alloc] initWithRequest:request];
					
				[directions calculateDirectionsWithCompletionHandler:
				 ^(MKDirectionsResponse *response, NSError *error)
				 {
					 if (error)
					 {
							 // Handle error
							 NSLog(@"erreur lors du calcul de la route");
					 } else
					 {
						 [self showRoute:response];
						 
					 }
				 }];
			}
			
			break;
		case 1://sophia
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:sophia.infos];
			[mapView setCenterCoordinate:sophia.infos.coordinate];
			
			if(mapSelect.selectedSegmentIndex==0)
			{
				CLLocationCoordinate2D coordinateArray[2];
				coordinateArray[0] = userLocation.coordinate;
				coordinateArray[1] = sophia.infos.coordinate;
				
				
				self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
				[self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]];
				[mapView removeOverlays:mapView.overlays];
				
				MKDirectionsRequest *request =
				[[MKDirectionsRequest alloc] init];
				
				
				request.destination =
				[[MKMapItem alloc]initWithPlacemark:
				 [[MKPlacemark alloc]initWithCoordinate:sophia.infos.coordinate addressDictionary:nil]];
				
				request.source = [MKMapItem mapItemForCurrentLocation];
				
				MKDirections *directions =
				[[MKDirections alloc] initWithRequest:request];
				
				[directions calculateDirectionsWithCompletionHandler:
				 ^(MKDirectionsResponse *response, NSError *error)
				 {
					 if (error)
					 {
							 // Handle error
						 NSLog(@"erreur lors du calcul de la route");
					 } else
					 {
						 [self showRoute:response];
						 
					 }
				 }];
			}
			break;
		case 2://canne
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:cannes.infos];
			[mapText setText:cannes.desc];
			[mapView setCenterCoordinate:cannes.infos.coordinate];
			
			if(mapSelect.selectedSegmentIndex==0)
			{
				CLLocationCoordinate2D coordinateArray[2];
				coordinateArray[0] = userLocation.coordinate;
				coordinateArray[1] = cannes.infos.coordinate;
				
				
				self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
				[self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]];
				[mapView removeOverlays:mapView.overlays];
				
				MKDirectionsRequest *request =
				[[MKDirectionsRequest alloc] init];
				
				
				request.destination =
				[[MKMapItem alloc]initWithPlacemark:
				 [[MKPlacemark alloc]initWithCoordinate:cannes.infos.coordinate addressDictionary:nil]];
				
				request.source = [MKMapItem mapItemForCurrentLocation];
				
				MKDirections *directions =
				[[MKDirections alloc] initWithRequest:request];
				
				[directions calculateDirectionsWithCompletionHandler:
				 ^(MKDirectionsResponse *response, NSError *error)
				 {
					 if (error)
					 {
							 // Handle error
						 NSLog(@"erreur lors du calcul de la route");
					 } else
					 {
						 [self showRoute:response];
						 
					 }
				 }];
			}
			break;
		case 3://menton
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:menton.infos];
			[mapText setText:menton.desc];
			[mapView setCenterCoordinate:menton.infos.coordinate];
			
			if(mapSelect.selectedSegmentIndex==0)
			{
				CLLocationCoordinate2D coordinateArray[2];
				coordinateArray[0] = userLocation.coordinate;
				coordinateArray[1] = menton.infos.coordinate;
				
				
				self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
				[self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]];
				[mapView removeOverlays:mapView.overlays];
				
				MKDirectionsRequest *request =
				[[MKDirectionsRequest alloc] init];
				
				
				request.destination =
				[[MKMapItem alloc]initWithPlacemark:
				 [[MKPlacemark alloc]initWithCoordinate:menton.infos.coordinate addressDictionary:nil]];
				
				request.source = [MKMapItem mapItemForCurrentLocation];
				
				MKDirections *directions =
				[[MKDirections alloc] initWithRequest:request];
				
				[directions calculateDirectionsWithCompletionHandler:
				 ^(MKDirectionsResponse *response, NSError *error)
				 {
					 if (error)
					 {
							 // Handle error
						 NSLog(@"erreur lors du calcul de la route");
					 } else
					 {
						 [self showRoute:response];
						 
					 }
				 }];
	
			}
			break;
		case 4://cannes la bocca
			[mapView removeAnnotations:[mapView annotations]];
			[mapView addAnnotation:bocca.infos];
			[mapText setText:bocca.desc];
			[mapView setCenterCoordinate:bocca.infos.coordinate];
			
			if(mapSelect.selectedSegmentIndex==0)
			{
				CLLocationCoordinate2D coordinateArray[2];
				coordinateArray[0] = userLocation.coordinate;
				coordinateArray[1] = bocca.infos.coordinate;
				
				
				self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
				[self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]];
				[mapView removeOverlays:mapView.overlays];
				
				MKDirectionsRequest *request =
				[[MKDirectionsRequest alloc] init];
				
				
				request.destination =
				[[MKMapItem alloc]initWithPlacemark:
				 [[MKPlacemark alloc]initWithCoordinate:bocca.infos.coordinate addressDictionary:nil]];
				
				request.source = [MKMapItem mapItemForCurrentLocation];
				
				MKDirections *directions =
				[[MKDirections alloc] initWithRequest:request];
				
				[directions calculateDirectionsWithCompletionHandler:
				 ^(MKDirectionsResponse *response, NSError *error)
				 {
					 if (error)
					 {
							 // Handle error
						 NSLog(@"erreur lors du calcul de la route");
					 } else
					 {
						 [self showRoute:response];
						 
					 }
				 }];
			}
			
			break;
	}
	 
}

-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        [mapView
		 addOverlay:route.polyline level:MKOverlayLevelAboveRoads];

		
		/*
        for (MKRouteStep *step in route.steps)
        {
            NSLog(@"%@", step.instructions);
        }
		*/
		
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
