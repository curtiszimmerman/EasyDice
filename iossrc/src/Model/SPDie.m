/*
 * Easy Dice - An application for rolling dice of your choosing.
 * Copyright (C) 2011-2014 Slobodan Pejic (slobo@pejici.net)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
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
     andFacingSide: (int) facing
{
	if (!(self = [super init])) {
		return nil;
	}
	dieSize = size;
	numFacing = facing;
	multiplier = 1;
	valueOffset = 0;
	return self;
}

+(id) dieWithSize: (int) size
    andFacingSide: (int) facing
{
	return ([[[SPDie alloc] initWithSize: size
			      andFacingSide: facing] autorelease]);
}


-(id) initWithSize: (int) size
     andFacingSide: (int) facing
     andMultiplier: (int) multiplier_
    andValueOffset: (int) offset
{
	if (!(self = [self initWithSize: size andFacingSide: facing])) {
		return nil;
	}
	multiplier = multiplier_;
	valueOffset = offset;
	return self;
}

+(id) dieWithSize: (int) size
    andFacingSide: (int) facing
    andMultiplier: (int) multiplier
   andValueOffset: (int) offset
{
	SPDie* die = [[SPDie alloc] initWithSize: size
				   andFacingSide: facing
				   andMultiplier: multiplier
				  andValueOffset: offset];
	return ([die autorelease]);
}

-(id) initWithRollDie: (SPDie*) die
{
	int size = [die dieSize];
	int value = (random() >> 5) % size + 1;
	int mult = die->multiplier;
	int offset = die->valueOffset;
	if (!(self = [self initWithSize: size
	                  andFacingSide: value
	                  andMultiplier: mult
	                 andValueOffset: offset]))
	{
		return nil;
	}
	return self;
}

+(id) dieWithRollDie: (SPDie*) die
{
	return ([[[[die class] alloc] initWithRollDie: die] autorelease]);
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

-(int) value
{
	return (numFacing * multiplier + valueOffset);
}

-(NSString*) toString
{
	if (multiplier == 1) {
		return ([NSString stringWithFormat: @"d%d-%d",
			 dieSize, numFacing]);
	}
	else {
		return ([NSString stringWithFormat: @"d%d-%dx%d",
			 dieSize, numFacing, multiplier]);
	}
}

@end
