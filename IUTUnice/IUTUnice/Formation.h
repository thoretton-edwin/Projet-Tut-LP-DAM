//
//  Formation.h
//  IUTUnice
//
//  Created by VM Mac on 20/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Formation : NSObject

@property NSString* mId;
@property NSString* mTypeFormation;
@property NSString* mTitle;
@property NSString* mBody;

-(id) init;
-(id) initWithId:(NSString*)ident withType:(NSString*)type withTitle:(NSString*)title;

-(NSString*) getId;
-(NSString*) getTitle;
-(NSString*) getType;
-(NSString*) getBody;
-(void) setBody: (NSString*)body;

@end
