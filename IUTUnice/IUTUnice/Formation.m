//
//  Formation.m
//  IUTUnice
//
//  Created by VM Mac on 20/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Formation.h"

@implementation Formation

- (id) init{
    return  self = [super init];
}

- (id) initWithId:(NSString *)ident withType:(NSString *)type withTitle:(NSString *)title{
    self = [super init];
    self->_mTitle = title;
    self->_mId = ident;
    self->_mTypeFormation = type;
    self->_mBody = @"content";
    
    return  self;
}

- (NSString*) getId{
    return self->_mId;
}

- (NSString*) getTitle{
    return self->_mTitle;
}

- (NSString*) getType{
    return self->_mTypeFormation;
}

- (NSString*) getBody{
    return self->_mBody;
}

- (void) setBody:(NSString *)body{
    self->_mBody = body;
}



@end
