//
//  Renseignement.h
//  IUTUnice
//
//  Created by Edwin Thoretton on 04/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Renseignement : NSObject
@property NSString*nom;
@property NSMutableArray* adresses;

-(id)initWhithName:(NSString*)name andAdresses:(NSMutableArray*)adr;
@end
