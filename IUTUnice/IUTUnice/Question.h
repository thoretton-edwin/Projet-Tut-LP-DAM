//
//  Question.h
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property  NSString* intitule;
@property NSMutableArray* reponseArray;

-(id) init;
-(id) initWithIntitule:(NSString*)inti andArray:(NSMutableArray*)repArray;

@end
