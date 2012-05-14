//
//  TransparentOverlay+Private.h
//  DropDownList1
//
//  Created by Nick Marchenko on 01.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransparentOverlay.h"

@class BaseItemObject;

@interface TransparentOverlay (Private)

- (void) _initBackgroundImage;
- (void) _initTable;
+ (void) _pasteData:(BaseItemObject*)_data To:(id)_destination WithType:(NSString*) type;

@end
