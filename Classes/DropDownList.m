//
//  DropDownList.m
//  DropDownList1
//
//  Created by Nick Marchenko on 30.09.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DropDownList.h"
#import "TransparentOverlay+Private.h"
#import "BaseItemObject.h"
#import "Configuration.h"

@implementation DropDownList


@synthesize button;
@synthesize theTransparentOverlay;

@synthesize name;
@synthesize type;
@synthesize buttonInstructionLabelFrame;
@synthesize activeImage;
@synthesize inActiveImage;
@synthesize objects;
@synthesize cellDispAmount;
@synthesize delegate;
@synthesize parentViewController;

- (void) setCellBGImage:(UIImage *) _cellBGImage setCellBGHoverImage:(UIImage *) _cellBGHoverImage;
{
	[cellBGImage release];
	cellBGImage=[_cellBGImage retain];
	[cellBGHoverImage release];
	cellBGHoverImage=[_cellBGHoverImage retain];
}
- (void) setTopMainBG:(UIImage *) _topMainBG setMiddleBG:(UIImage *) _middleMainBG setBottom:(UIImage *) _bottomMainBG
{
	[topMainBG release];
	topMainBG=[_topMainBG retain];
	[middleMainBG release];
	middleMainBG=[_middleMainBG retain];
	[bottomMainBG release];
	bottomMainBG=[_bottomMainBG retain];
	
}

- (void) setBGXMargin:(CGFloat) x BGYMargin:(CGFloat) y BGUnderTableHeight:(CGFloat) h
{
	xBGMargin = x;
	yBGMargin = y;
	bgUnderTableHeight = h;
}

- (void) setTableXMargin:(CGFloat) x TableYMargin:(CGFloat) y
{
	tableXMargin = x;
	tableYMargin = y;
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (id) initWithOrigin:(CGPoint)_origin
		  ActiveImage:(UIImage*)_activeImage
	WithInactiveImage:(UIImage*)_inactiveImage
{
	self.activeImage=_activeImage;
	self.inActiveImage=_inactiveImage;
	CGRect frame=CGRectMake(_origin.x, _origin.y, _activeImage.size.width, _activeImage.size.height);
	if (self=[super initWithFrame:frame])
	{
		button=[[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, inActiveImage.size.width, inActiveImage.size.height)];
		[button setBackgroundImage:inActiveImage forState:UIControlStateNormal];
		[button setUserInteractionEnabled:NO];
		[button addTarget:self action:@selector(showDropDownList:) forControlEvents:UIControlEventTouchDown];
		[self addSubview:button];
		
		// Assign default value 
		previouslySelectedCell=-1;
	}
	return self;
}

- (void) closeDropDownList
{
	[theTransparentOverlay closeOpenDropdownList];
}

- (void) showDropDownList: (id) sender
{
	if (theTransparentOverlay == nil)
	{
		theTransparentOverlay=[[TransparentOverlay alloc] initWithButtonOrigin:self.frame.origin];	
		theTransparentOverlay.type = type;
	
		theTransparentOverlay.tableXMargin = tableXMargin;
		theTransparentOverlay.tableYMargin = tableYMargin;

		theTransparentOverlay.topMainBG=topMainBG;
		theTransparentOverlay.middleMainBG=middleMainBG;
		theTransparentOverlay.bottomMainBG=bottomMainBG;
		theTransparentOverlay.xBGMargin = xBGMargin;
		theTransparentOverlay.yBGMargin = yBGMargin;
		theTransparentOverlay.bgUnderTableHeight = bgUnderTableHeight;
	
		theTransparentOverlay.cellBGImage=cellBGImage;
		theTransparentOverlay.cellBGHoverImage=cellBGHoverImage;
	
		theTransparentOverlay.cellDispAmount=cellDispAmount;	
		theTransparentOverlay.delegate=self;
	}
	
	// Paste doObjects
	theTransparentOverlay.objects = objects;	
	
	[parentViewController.view addSubview:theTransparentOverlay];
	
	theTransparentOverlay.previouslySelectedCell=previouslySelectedCell;
	
	[theTransparentOverlay showOpenDropDownList];	
	
	// Set delegate method dropDownListDidShow
	[delegate dropDownListDidShown:self];
}

- (void) setUserInteractionEnabled:(BOOL)_value
{
	[button setUserInteractionEnabled:_value];
	for (UIView *v in [button subviews])
		if ([v tag]==1)
			[v removeFromSuperview];
	
	UILabel *buttonLabel=[[UILabel alloc] initWithFrame:buttonInstructionLabelFrame];
	if (_value)
	{
		[button setBackgroundImage:activeImage forState:UIControlStateNormal];
		[button setBackgroundImage:activeImage forState:UIControlStateHighlighted];
		[buttonLabel setTextColor:BUTTON_LABEL_ACTIVE_COLOR];
		// Assign default value 
		previouslySelectedCell=-1;
	}
	else
	{
		[button setBackgroundImage:inActiveImage forState:UIControlStateNormal];
		[buttonLabel setTextColor:BUTTON_LABEL_INACTIVE_COLOR];
		// Assign default value 
		previouslySelectedCell=-1;
	}
	[buttonLabel setText:name];
	buttonLabel.tag=1;
	[buttonLabel setFont:BUTTON_LABEL_FONT];
	[buttonLabel setBackgroundColor:[UIColor clearColor]];
	[button addSubview:buttonLabel];
	[buttonLabel release];

}

- (BaseItemObject*) getSelectedCell
{
	for (BaseItemObject *cell in objects)
		if (cell.isCurrentlySelected)
			return cell;
	return nil;
}

- (void) clearSelectedCell
{
	for (BaseItemObject *cell in objects)
		cell.isCurrentlySelected=NO;
}

- (void) updateButtonImage
{
	if (previouslySelectedCell != -1)
	{
		// Remove subview from button
		for (UIView *v in [button subviews])
			if ([v tag]==1)
				[v removeFromSuperview];
		// Paste data to button	
		BaseItemObject *tempBaseItemObject=[objects objectAtIndex:previouslySelectedCell];
		[TransparentOverlay _pasteData:tempBaseItemObject To:button WithType:type];	
	}
}

#pragma mark -
#pragma mark DropDownList table delegate

- (void) cellDidSelected:(int) row
{
	// Set the delegate
	[delegate dropDownListItemDidSelected:self WithNumber:row];
	
	previouslySelectedCell=row;
	// Remove subview from button
	for (UIView *v in [button subviews])
		if ([v tag]==1)
			[v removeFromSuperview];
	// Paste data to button
	BaseItemObject *tempBaseItemObject=[objects objectAtIndex:row];
	[TransparentOverlay _pasteData:tempBaseItemObject To:button WithType:type];	
}

#pragma mark -
#pragma mark Memory manegament

- (void)dealloc {
	[button release];
	[name release];
	[type release];
	[theTransparentOverlay release];
	[activeImage release];
	[inActiveImage release];
	
	[cellBGImage release];
	[cellBGHoverImage release];
	
	[topMainBG release];
	[bottomMainBG release];
	[middleMainBG release];
	
	[objects release];
    [super dealloc];
}


@end
