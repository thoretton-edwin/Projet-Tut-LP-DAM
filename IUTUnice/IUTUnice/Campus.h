//
//  Campus.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 20/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Campus : NSObject
{
	
}
@property (strong,nonatomic) MKPointAnnotation* infos;
@property (strong,nonatomic) NSMutableArray* services;
@property (strong,nonatomic) NSString* desc;

@end
