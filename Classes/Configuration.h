//
//  Configuration.h
//  CustomDropDownList
//
//  Created by Nick Marchenko on 21.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


// Hold data for creating dropdownlist using images

#import <Foundation/Foundation.h>


// Frame of label in button to open dropdownlist
#define BUTTON_INSTRUCTION_LABEL_FRAME						CGRectMake(14.0,20.0,200.0,12.0)

// Font of text in button to open dropdownlist
#define BUTTON_LABEL_FONT									[UIFont fontWithName:@"HelveticaNeue-Bold" size:12.82]

// Color of text in button to open dropdownlist (active/no-active)
#define BUTTON_LABEL_ACTIVE_COLOR							[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]
#define BUTTON_LABEL_INACTIVE_COLOR							[UIColor colorWithRed:0.125 green:0.145 blue:0.156 alpha:1.0]

// Color of dropdownlist background when the dropdownlist is open
#define DROPDOWNLIST_BG_COLOR								[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]

// Color/Font of title in dropdownlist item and button
#define TITLE_LABEL_COLOR									[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]
#define TITLE_LABEL_FONT									[UIFont fontWithName:@"HelveticaNeue-Bold" size:12.82]

// Color/Font of description in dropdownlist item and button
#define DESCRIPTION_LABEL_COLOR								[UIColor colorWithRed:0.41 green:0.47 blue:0.52 alpha:1.0]
#define DESCRIPTION_LABEL_FONT								[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.08]

// Frame for title in dropdownlist item / button
#define ITEM_TITLE_LABEL_FRAME								CGRectMake(46.0,14.0,180.0,10.0)
#define BUTTON_TITLE_LABEL_FRAME							CGRectMake(50.0,13.0,180.0,10.0)

// Frame for description in dropdownlist item / button
#define ITEM_DESCRIPTION_LABEL_FRAME						CGRectMake(44.0,29.0,180.0,10.0)
#define BUTTON_DESCRIPTION_LABEL_FRAME						CGRectMake(48.0,28.0,180.0,10.0)

// Frane for image view in dropdownlist item / button
#define ITEM_IMAGE_VIEW_FRAME								CGRectMake(5.0,7.0,36.0,36.0)
#define BUTTON_IMAGE_VIEW_FRAME								CGRectMake(8.0,7.0,36.0,36.0)

@interface Configuration : NSObject {
	UIImage *buttonActiveBG;
	UIImage *buttonNoActiveBG;
	UIImage *itemBGHoved;
	UIImage *itemBG;
	UIImage *openBGTop;
	UIImage *openBGMiddle;
	UIImage *openBGBottom;
}

@property (nonatomic, retain) UIImage *buttonActiveBG;
@property (nonatomic, retain) UIImage *buttonNoActiveBG;
@property (nonatomic, retain) UIImage *itemBGHoved;
@property (nonatomic, retain) UIImage *itemBG;
@property (nonatomic, retain) UIImage *openBGTop;
@property (nonatomic, retain) UIImage *openBGMiddle;
@property (nonatomic, retain) UIImage *openBGBottom;

@end
