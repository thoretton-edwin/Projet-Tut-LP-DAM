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



@end
