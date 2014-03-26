//
//  Question.m
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Question.h"

@implementation Question

-(id) init{
    return self = [super init];
}

-(id) initWithIntitule:(NSString *)inti andArray:(NSMutableArray *)repArray{
    self = [self init];
    self->_intitule = inti;
    _reponseArray = [self->_reponseArray initWithArray: repArray];
    return self;
}

@end
