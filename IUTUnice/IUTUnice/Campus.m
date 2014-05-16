//
//  Campus.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 20/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Campus.h"

@implementation Campus
{
	
}
@synthesize desc;
-(id)init
{
	self= [super init];
	if(!self)
	{
		self.services = [[NSMutableArray alloc]init];
		self.infos = nil;
		desc=@" ";
	}
	return self;
}

@synthesize services;
@end
