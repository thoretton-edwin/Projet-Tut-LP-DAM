//
//  Reponse.m
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Reponse.h"

@implementation Reponse

-(id) init{
    return self = [super init];
}

-(id) initWithId:(NSString *)ident andIntitule:(NSString *)intitu{
    self = [self init];
    self->_identifiant = ident;
    self->_intitule = intitu;
    return self;
}

@end
