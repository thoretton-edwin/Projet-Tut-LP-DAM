//
//  Module.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Module : NSObject
@property NSString*nom;
@property NSArray* notes;
@property int moduleTag;
-(id)initWithName:(NSString*)myName AndNotes:(NSArray*)myNotes;
@end
