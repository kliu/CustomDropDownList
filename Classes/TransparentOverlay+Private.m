//
//  TransparentOverlay+Private.m
//  DropDownList1
//
//  Created by Nick Marchenko on 01.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransparentOverlay+Private.h"
#import "Configuration.h"
#import "BaseDataObject.h"

@implementation TransparentOverlay (Private)

- (void) _initBackgroundImage
{	
	if (bgView == nil)
	{	
		CGFloat totalBGHeigth = 0;
		
		if (cellDispAmount>[objects count]) 
			cellDispAmount=[objects count];
	
		totalBGHeigth=(bgUnderTableHeight+tableYMargin)+
		cellBGHoverImage.size.height*cellDispAmount;
	
		if (totalBGHeigth<(topMainBG.size.height+bottomMainBG.size.height))
			totalBGHeigth=(topMainBG.size.height+bottomMainBG.size.height);
		
		bgView=[[UIImageView alloc] initWithFrame:CGRectMake(buttonOrigin.x+xBGMargin, buttonOrigin.y+yBGMargin,topMainBG.size.width, totalBGHeigth)];
	
		UIImageView *topBGImageView=[[UIImageView alloc] initWithImage:topMainBG];
	
		UIImageView *middleBGImageView=[[UIImageView alloc] initWithFrame:
										CGRectMake(0, topBGImageView.frame.size.height,
												   middleMainBG.size.width, totalBGHeigth-topMainBG.size.height-bottomMainBG.size.height)];
		[middleBGImageView setImage:middleMainBG];
	
		UIImageView *bottomBGImageView=[[UIImageView alloc]initWithImage:bottomMainBG];
		CGRect frame=bottomBGImageView.frame;
		frame.origin.y=topBGImageView.frame.size.height+middleBGImageView.frame.size.height;
		bottomBGImageView.frame=frame;
	
		// Add all
		[bgView addSubview:topBGImageView];
		[bgView addSubview:middleBGImageView];
		[bgView addSubview:bottomBGImageView];
	
		[topBGImageView release];
		[middleBGImageView release];
		[bottomBGImageView release];
	}
	[self addSubview:bgView];
}

- (void) _initTable
{	
	if (table == nil)
	{
		table=[[UITableView alloc] initWithFrame:CGRectMake(buttonOrigin.x+tableXMargin, buttonOrigin.y+tableYMargin,
															cellBGHoverImage.size.width, cellDispAmount*cellBGHoverImage.size.height)];
		[table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
		[table setBackgroundColor:[UIColor blackColor]];
		table.delegate=self;
		table.dataSource=self;
	}
	[table reloadData];	
	[self addSubview:table];
}

+ (void) _pasteData:(BaseItemObject*)_data To:(id)_destination WithType:(NSString*) type
{
	UILabel *nameLabel;
	UILabel *descriptionLabel;
	UIImageView *imageView;	
	
	if ([type isEqual:@"BROWSEDROPDOWNBIG_TYPE"])
	{
	}
	else if ([type isEqual:@"BROWSEDROPDOWNSMALL_TYPE"])
	{
	}
	else
	{
		if ([_destination isKindOfClass:[UIButton class]])
		{
			nameLabel=[[UILabel alloc] initWithFrame:BUTTON_TITLE_LABEL_FRAME];
			descriptionLabel=[[UILabel alloc] initWithFrame:BUTTON_DESCRIPTION_LABEL_FRAME];
			imageView=[[UIImageView alloc] initWithFrame:BUTTON_IMAGE_VIEW_FRAME];
		}
		else
		{
			nameLabel=[[UILabel alloc] initWithFrame:ITEM_TITLE_LABEL_FRAME];
			descriptionLabel=[[UILabel alloc] initWithFrame:ITEM_DESCRIPTION_LABEL_FRAME];
			imageView=[[UIImageView alloc] initWithFrame:ITEM_IMAGE_VIEW_FRAME];				
		}
		
		BaseDataObject *dataToFillTheitem = _data.dataObject;
		
		[nameLabel setText:dataToFillTheitem.name];
		[nameLabel setBackgroundColor:[UIColor clearColor]];
		[nameLabel setTextColor:TITLE_LABEL_COLOR];
		[nameLabel setFont:TITLE_LABEL_FONT];
		[nameLabel setShadowColor:[UIColor blackColor]];
		[nameLabel setShadowOffset:CGSizeMake(0.0, -1.0)];
		[_destination addSubview:nameLabel];
		
		[descriptionLabel setText:dataToFillTheitem.description];
		[descriptionLabel setBackgroundColor:[UIColor clearColor]];
		[descriptionLabel setTextColor:DESCRIPTION_LABEL_COLOR];
		[descriptionLabel setFont:DESCRIPTION_LABEL_FONT];
		[descriptionLabel setShadowColor:[UIColor blackColor]];
		[descriptionLabel setShadowOffset:CGSizeMake(0.0, -1.0)];
		[_destination addSubview:descriptionLabel];
			
		[imageView setImage:dataToFillTheitem.image];
		[_destination addSubview:imageView];
		
		nameLabel.tag=1;
		descriptionLabel.tag=1;
		imageView.tag=1;
		
		[nameLabel release];
		[descriptionLabel release];
		[imageView release];
	}	
}	

@end
