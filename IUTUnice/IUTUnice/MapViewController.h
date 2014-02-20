//
//  MapViewController.h
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController :UIViewController <MKMapViewDelegate>
{
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapSelect;
@property (weak, nonatomic) IBOutlet UITextView *mapText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *campusSelect;

@end
