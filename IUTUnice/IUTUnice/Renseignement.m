//
//  Renseignement.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 04/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Renseignement.h"

@implementation Renseignement

@synthesize nom;
@synthesize adresses;

-(id)initWhithName:(NSString*)name andAdresses:(NSMutableArray*)adr
{
	self= [super init];
	if(self)
	{
		self.nom =name;
		self.adresses = [[NSMutableArray alloc]initWithArray:adr];
	}
	return self;
}
@end
