//
//  TransparentOverlay.m
//  DropDownList1
//
//  Created by Nick Marchenko on 01.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransparentOverlay.h"
#import "TransparentOverlay+Private.h"

@implementation TransparentOverlay

// Set 1024 for both (wigth and heigth) to support all interface orientations
#define WINDOW_FRAME									CGRectMake(0.0, 0.0, 1024.0, 1024.0)

@synthesize table;
@synthesize buttonOrigin;
@synthesize type;
@synthesize cellDispAmount;
@synthesize previouslySelectedCell;
@synthesize cellBGImage;
@synthesize cellBGHoverImage;
@synthesize topMainBG;
@synthesize middleMainBG;
@synthesize bottomMainBG;
@synthesize xBGMargin;
@synthesize yBGMargin;
@synthesize bgUnderTableHeight;
@synthesize tableXMargin;
@synthesize tableYMargin;
@synthesize objects;
@synthesize delegate;

- (id)initWithButtonOrigin:(CGPoint)_buttonOrigin
{
    if ((self = [super initWithFrame:WINDOW_FRAME])) {
		buttonOrigin=_buttonOrigin;
		[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void) showOpenDropDownList
{
	[self _initBackgroundImage];
	[self _initTable];
	
	// Scroll TableView to previouslySelectedCell
	if (previouslySelectedCell!=-1)
	{
		CGPoint contentPoint=CGPointMake(0.0, previouslySelectedCell*cellBGHoverImage.size.height);
		if (contentPoint.y + table.frame.size.height >= table.contentSize.height)
			contentPoint.y = ([objects count] - cellDispAmount) * cellBGHoverImage.size.height;
		[self.table setContentOffset:contentPoint];
	}
}

#pragma mark -
#pragma mark Click handle

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self removeFromSuperview];
}

- (void) closeOpenDropdownList
{
	[self removeFromSuperview];
}

#pragma mark -
#pragma mark TableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return [objects count];
	return [objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }  
	
	// Remove subviews
	for (UIView *v in [cell subviews])
		if ([v tag]==1)
			[v removeFromSuperview];
	
	// Set cell bg hover
	cell.selectedBackgroundView = [[[UIImageView alloc] initWithImage:cellBGHoverImage] autorelease];
	
	int k=[indexPath row];
	
	// Set cell bg image
	// If the cell is NOT highlighted
	if ((k!=previouslySelectedCell))
	{
		UIImageView *cellBGImageView=[[UIImageView alloc] initWithImage:cellBGImage];
		cellBGImageView.tag=1;
		[cell addSubview:cellBGImageView];
		[cellBGImageView release];
	}
	
	// Higthlight previously selected cell
	if ((k==previouslySelectedCell)&&(previouslySelectedCell!=-1))
	{
		UIImageView *cellBGImageView=[[UIImageView alloc] initWithImage:cellBGHoverImage];
		cellBGImageView.tag=1;
		[cell addSubview:cellBGImageView];
		[cellBGImageView release];
		
		// Remove bg image when cell hovered
		cell.selectedBackgroundView=nil;
	}	
	
	// Set up cell info
	BaseItemObject *tempBaseItemObject=[objects objectAtIndex:k];
	[TransparentOverlay _pasteData:tempBaseItemObject To:cell  WithType:type];
		
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	int k=[indexPath row];
	if (previouslySelectedCell!=k)
	{
		previouslySelectedCell = k;
		[table reloadData];
		[delegate cellDidSelected:k];
	}
	[self removeFromSuperview];
}

 //define the cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return cellBGHoverImage.size.height;
}

 //define the cell background color
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = [UIColor blackColor];	
}


#pragma mark -
#pragma mark Memory manegament

- (void)dealloc {
	[table release];
	[type release];
	[cellBGImage release];
	[cellBGHoverImage release];
	[bgView release];
	[topMainBG release];
	[middleMainBG release];
	[bottomMainBG release];
	[objects release];
    [super dealloc];
}


@end
