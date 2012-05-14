//
//  Configuration.m
//  CustomDropDownList
//
//  Created by Nick Marchenko on 21.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

@synthesize buttonActiveBG;
@synthesize buttonNoActiveBG;
@synthesize itemBGHoved;
@synthesize itemBG;
@synthesize openBGTop;
@synthesize openBGMiddle;
@synthesize openBGBottom;

- (id) init
{
	if (self = [super init])
	{
		self.buttonActiveBG = [UIImage imageNamed:@"but-bg-active.png"];
		self.buttonNoActiveBG = [UIImage imageNamed:@"but-bg-no-active.png"];
		self.itemBGHoved = [UIImage imageNamed:@"dropdown-item-bg-hover.png"];
		self.itemBG = [UIImage imageNamed:@"dropdown-item-bg.png"];
		self.openBGTop = [UIImage imageNamed:@"open-dropdown-bg-top.png"];
		self.openBGMiddle = [UIImage imageNamed:@"open-dropdown-bg-inner.png"];
		self.openBGBottom = [UIImage imageNamed:@"open-dropdown-bg-bottom.png"];
	}
	return self;
}

- (void) dealloc
{
	[buttonActiveBG release];
	[buttonNoActiveBG release];
	[itemBGHoved release];
	[itemBG release];
	[openBGTop release];
	[openBGMiddle release];
	[openBGBottom release];
	
	[super dealloc];
}
@end
