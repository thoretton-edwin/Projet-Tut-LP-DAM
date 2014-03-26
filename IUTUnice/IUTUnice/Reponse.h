//
//  Reponse.h
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reponse : NSObject

@property NSString* identifiant;
@property NSString* intitule;

-(id) init;
-(id) initWithId:(NSString*)ident andIntitule:(NSString*)intitu;

@end
