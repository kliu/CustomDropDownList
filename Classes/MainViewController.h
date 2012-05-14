//
//  MainViewController.h
//  CustomDropDownList
//
//  Created by Nick Marchenko on 21.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownList.h"

@interface MainViewController : UIViewController <DropDownListDelegate>{
	DropDownList *myDropDownList;
	NSMutableArray *dropDownListItems;	//BaseCellObjects instances
}

@end

@interface MainViewController (Private)

- (void) _initDropDownList;
- (void) _initDropDownListContent;
- (void) _initLembergsLogo;

@end
