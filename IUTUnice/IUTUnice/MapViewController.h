//
//  MapViewController.h
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKOverlay.h>
#import <MapKit/MKOverlayView.h>
#import "BusViewController.h"
#import "Campus.h"

@interface MapViewController :UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
{
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapSelect;
@property (weak, nonatomic) IBOutlet UITextView *mapText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *campusSelect;
@property CLLocationManager* manager;
@property CLLocationCoordinate2D userLoc;
@property (nonatomic, retain) MKPolyline *routeLine; //your line
@property (nonatomic, retain) MKPolylineView *routeLineView; //overlay view
@property MKUserLocation *userLocation;
@property NSMutableArray* data;
@property NSMutableArray* campusData;

//campus

@property (strong,nonatomic) Campus* nice;
@property (strong,nonatomic) Campus* sophia;
@property (strong,nonatomic) Campus* cannes;
@property (strong,nonatomic) Campus* menton;
@property (strong,nonatomic) Campus* bocca;
@property (strong,nonatomic) Campus* itemSelected ;




@end
