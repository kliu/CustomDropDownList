//
//  TransparentOverlay.h
//  DropDownList1
//
//  Created by Nick Marchenko on 01.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseItemObject.h"

@protocol DropDownListTableDelegate;

@interface TransparentOverlay : UIView <UITableViewDelegate, UITableViewDataSource>
{
	UITableView		*table;
	
	// CGPoint - the origin of the button
	CGPoint			buttonOrigin;
	
	// Type (uses in _pasteData: To:)
	NSString		*type;
	
	// Cell background
	UIImage			*cellBGImage;
	// Cell background hover
	UIImage			*cellBGHoverImage;
	
	// Cell amount to disp
	int				cellDispAmount;
	// Previously selected cell
	int				previouslySelectedCell;
	
	// Main background
	UIView *bgView;
	
	// Top
	UIImage			*topMainBG;
	// Middle
	UIImage			*middleMainBG;
	// Bottom
	UIImage			*bottomMainBG;
	// BG x, y margin
	CGFloat			xBGMargin;
	CGFloat			yBGMargin;
	// BG under table height
	CGFloat			bgUnderTableHeight;
	
	// Table possition according to the dropdown button
	CGFloat			tableXMargin;
	CGFloat			tableYMargin;
	
	// Array for table cells
	NSMutableArray *objects;		//BaseItemsObject instances	
	
	id<DropDownListTableDelegate> delegate;
}

@property (nonatomic, retain) UITableView						*table;
@property CGPoint												buttonOrigin;
@property (nonatomic, retain) NSString							*type;
@property int													cellDispAmount;
@property int													previouslySelectedCell;
@property (nonatomic, retain) UIImage							*cellBGImage;
@property (nonatomic, retain) UIImage							*cellBGHoverImage;
@property (nonatomic, retain) UIImage							*topMainBG;
@property (nonatomic, retain) UIImage							*middleMainBG;
@property (nonatomic, retain) UIImage							*bottomMainBG;
@property (nonatomic, assign) CGFloat							xBGMargin;
@property (nonatomic, assign) CGFloat							yBGMargin;
@property (nonatomic, assign) CGFloat							bgUnderTableHeight;
@property (nonatomic, assign) CGFloat							tableXMargin;
@property (nonatomic, assign) CGFloat							tableYMargin;
@property (nonatomic, retain) NSMutableArray					*objects;
@property (nonatomic, retain) id<DropDownListTableDelegate>		delegate;

- (id)		initWithButtonOrigin:(CGPoint)_buttonOrigin;
- (void)	showOpenDropDownList;
- (void)	closeOpenDropdownList;

@end

@protocol DropDownListTableDelegate
- (void) cellDidSelected:(int) row;
@end

