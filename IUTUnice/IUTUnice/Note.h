//
//  Note.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
@property NSString* nom;
@property NSNumber* note;
@property NSString* date;
@property int  tag;
-(id)initWithNom:(NSString*)monNom AndNote:(NSNumber*)maNote AndDate:(NSString*)maDate;
@end
