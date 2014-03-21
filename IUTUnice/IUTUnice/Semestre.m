//
//  Semestre.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Semestre.h"

@implementation Semestre
@synthesize nom;
@synthesize UEs;

-(id)initWithName:(NSString*)myName AndUes:(NSArray*)myUEs
{
	self = [super init];
	if(self)
	{
		self->nom = myName;
		self->UEs = [[NSArray alloc]initWithArray:myUEs];
	}
	return self;
}

@end
