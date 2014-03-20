//
//  UE.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UE : NSObject
@property NSString* nom;
@property NSArray* modules;
@property int tag;
-(id)initWithName:(NSString*)myName AndModules:(NSArray*)myModules;
@end
