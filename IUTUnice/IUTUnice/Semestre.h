//
//  Semestre.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Semestre : NSObject
@property NSString* nom;
@property NSArray* UEs;

-(id)initWithName:(NSString*)myName AndUes:(NSArray*)myUEs;
@end


