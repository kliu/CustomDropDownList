//
//  BaseDataObject.m
//  DropDownList
//
//  Created by Nick Marchenko on 22.09.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BaseDataObject.h"


@implementation BaseDataObject

@synthesize name;
@synthesize description;
@synthesize image;

-(id)initWithName:(NSString*)_name WithDescription:(NSString*)_description WithImage:(UIImage*)_image
{
	if (self=[super init]) 
	{
		self.name=_name;
		self.description=_description;
		self.image=_image;
	}
	return self;
}

-(void)dealloc
{
	[name release];
	[description release];
	[image release];
	
	[super dealloc];
}

@end
