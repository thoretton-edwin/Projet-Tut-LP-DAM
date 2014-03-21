//
//  Module.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Module.h"

@implementation Module
@synthesize nom;
@synthesize notes;
@synthesize moduleTag;


-(id)initWithName:(NSString*)myName AndNotes:(NSArray*)myNotes
{
	self=[super init];
	if(self)
	{
		self->nom=myName;
		self->notes = [[NSArray alloc]initWithArray:myNotes];
	}
	return self;
}
@end
