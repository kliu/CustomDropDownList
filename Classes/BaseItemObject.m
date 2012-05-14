//
//  BaseItemObject.m
//  ExtremeMusic
//
//  Created by Nick Marchenko on 14.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BaseItemObject.h"


@implementation BaseItemObject

@synthesize dataObject;
@synthesize isCurrentlySelected;


- (id) init
{
	if (self=[super init])
	{
		isCurrentlySelected = NO;
	}
	return self;
}

- (void) dealloc
{
	[dataObject release];
	
	[super dealloc];
}

@end
