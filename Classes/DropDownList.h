//
//  DropDownList.h
//  DropDownList1
//
//  Created by Nick Marchenko on 30.09.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransparentOverlay.h"

@protocol DropDownListDelegate;

@class BaseItemObject;
@class TransparentOverlay;

@interface DropDownList : UIView <DropDownListTableDelegate>
{	
	NSString		*name;
	
	// Type (BROWSEDROPDOWNBIG,BROWSEDROPDOWNSMALL, etc.)
	NSString		*type;
	
	// Buton to show the dropdownlist
	UIButton		*button;
	
	// Button instruction label frame
	CGRect			buttonInstructionLabelFrame;
	
	// Trasparent overlay to show dropdowlist
	TransparentOverlay *theTransparentOverlay;
	
	//active and inactive image
	UIImage			*activeImage;
	UIImage			*inActiveImage;
	
	//cell background
	UIImage			*cellBGImage;
	//cell background hover
	UIImage			*cellBGHoverImage;	
	//cell amount to disp
	int				cellDispAmount;
	//previously selected cell
	int				previouslySelectedCell;
	
	//main background
	//top
	UIImage			*topMainBG;
	//middle
	UIImage			*middleMainBG;
	//bottom
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
	NSMutableArray *objects;		//DOBaseDropDownCellObjects
	
	// Cell in DropDownList did selected
	id <DropDownListDelegate>	delegate;
	
	// Pointer to the parent view controller
	UIViewController *parentViewController;
}

@property (nonatomic, retain) NSString						*name;
@property (nonatomic, retain) NSString						*type;
@property (nonatomic, assign) CGRect						buttonInstructionLabelFrame;
@property (nonatomic, assign) int							cellDispAmount;
@property (nonatomic, retain) UIButton						*button;
@property (nonatomic, retain) TransparentOverlay			*theTransparentOverlay;
@property (nonatomic, retain) UIImage						*activeImage;
@property (nonatomic, retain) UIImage						*inActiveImage;
@property (nonatomic, retain) NSMutableArray				*objects;
@property (nonatomic, retain) id <DropDownListDelegate>		delegate;
@property (nonatomic, assign) UIViewController				*parentViewController;

- (void) setUserInteractionEnabled:(BOOL)_value;
- (id) initWithOrigin:(CGPoint)_origin ActiveImage:(UIImage*)_activeImage WithInactiveImage:(UIImage*)_inactiveImage;

- (void) setCellBGImage:(UIImage *) _cellBGImage setCellBGHoverImage:(UIImage *) _cellBGHoverImage;
- (void) setTopMainBG:(UIImage *) _topMainBG setMiddleBG:(UIImage *) _middleMainBG setBottom:(UIImage *) _bottomMainBG;

// Set up parametrs to add background under the table when dropdown is open
- (void) setBGXMargin:(CGFloat) x BGYMargin:(CGFloat) y BGUnderTableHeight:(CGFloat) h;

// Set parametrs to position the table according the dropdoen button
- (void) setTableXMargin:(CGFloat) x TableYMargin:(CGFloat) y;

- (BaseItemObject*) getSelectedCell;
- (void) clearSelectedCell;

// Update image in dropdownlist button
- (void) updateButtonImage;

// Closes dropdownlist manually
- (void) closeDropDownList;

// Opens dropdownlist by click on the button
- (void) showDropDownList: (id) sender;

@end

@protocol DropDownListDelegate

- (void) dropDownListItemDidSelected:(DropDownList*) theDropDownList WithNumber:(int) k;
- (void) dropDownListDidShown:(DropDownList*) theDropDownList;

@end



