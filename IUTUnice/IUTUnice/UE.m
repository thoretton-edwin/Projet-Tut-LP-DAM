//
//  UE.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "UE.h"

@implementation UE
@synthesize nom;
@synthesize modules;
@synthesize tag;
-(id)initWithName:(NSString*)myName AndModules:(NSArray*)myModules
{
	self=[super init];
	if(self)
	{
		self->nom = myName;
		self->modules = [[NSArray alloc]initWithArray:myModules];
	}
	return self;
}
@end
