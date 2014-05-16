//
//  Note.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "Note.h"

@implementation Note
@synthesize nom;
@synthesize note;
@synthesize date;
@synthesize tag;

-(id)initWithNom:(NSString*)monNom AndNote:(NSNumber*)maNote AndDate:(NSString*)maDate
{
	self = [super init];
	if(self)
	{
		self->nom = monNom;
		self->note = maNote;
		self->date = maDate;
	}
	return self;
}


@end
