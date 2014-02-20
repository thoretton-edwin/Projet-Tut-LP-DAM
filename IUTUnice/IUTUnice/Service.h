//
//  Service.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 20/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Service : NSObject
{
	
}

@property (strong,nonatomic) NSString* nom;
@property (strong,nonatomic) NSString* description;
@property  CLLocationCoordinate2D coord;

@end
