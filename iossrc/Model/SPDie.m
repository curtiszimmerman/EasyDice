//
//  SPDie.m
//  viewimagetouchtest
//
//  Created by Slobodan Pejic on 11-10-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SPDie.h"


@implementation SPDie

-(id) initWithSize: (int) size
    andFacingValue: (int) facing
{
	if (![super init]) {
		return nil;
	}
	dieSize = size;
	numFacing = facing;
	return self;
}

+(id) dieWithSize: (int) size
   andFacingValue: (int) facing
{
	return ([[[SPDie alloc] initWithSize: size
			      andFacingValue: facing] autorelease]);
}

-(BOOL) isEqual: (id) other
{
	if ([other isKindOfClass: [SPDie class]]) {
		SPDie* o = other;
		if (o->dieSize == self->dieSize
		    && o->numFacing == self->numFacing)
		{
			return YES;
		}
	}
	return NO;
}

-(int) dieSize
{
	return dieSize;
}

-(int) numFacing
{
	return numFacing;
}

-(NSString*) toString
{
	return ([NSString stringWithFormat: @"d%d-%d", dieSize, numFacing]);
}

@end