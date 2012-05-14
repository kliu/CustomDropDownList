    //
//  MainViewController.m
//  CustomDropDownList
//
//  Created by Nick Marchenko on 21.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "DropDownList.h"
#import "Configuration.h"
#import "BaseDataObject.h"

@implementation MainViewController

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// init LEMBEGS logo
	[self _initLembergsLogo];
	
	// init DropDownList
	[self _initDropDownList];
	
	// Set delegate
	myDropDownList.delegate = self;
	
	// Add to MainViewController
	[self.view addSubview:myDropDownList];
	
	// Init default content for myDropDownList
	[self _initDropDownListContent];
	
	// Paste data to myDropdownList
	myDropDownList.objects = dropDownListItems;
	
	// Make active (because it's inactive by default)
	[myDropDownList setUserInteractionEnabled:YES];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[myDropDownList release];
	[dropDownListItems release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark DropDownList delegate

- (void) dropDownListItemDidSelected:(DropDownList*) theDropDownList WithNumber:(int) k
{
	NSLog(@"item number: %i was selected in dropdownlist with name: %@", k + 1, theDropDownList.name);
}

- (void) dropDownListDidShown:(DropDownList*) theDropDownList
{
	NSLog(@"dropdownlist is shown");
}

@end


@implementation MainViewController (Private)

// myDropDownList button possition in MainViewController
#define MY_DROPDOWNLIST_ORIGIN									CGPointMake(270.0,400.0)

// myDropDownList name to use in delegate methods
#define MY_DROPDOWNLIST_NAME									@"CLICK TO SELECT"

// myDropDownList type to use in 
// + (void) _pasteData:(DOBaseDropDownCellObject*)_data To:(id)_destination WithType:(NSString*) type
// methos
#define MY_DROPDOWNLIST_TYPE									@"DEFAULT_TYPE"

// Number of items to display in myDropDownList
#define	ITEMS_NUMBER											9

// Instruction label frame in button
#define BUTTON_INSTRUCTION_LABEL_FRAME							CGRectMake(14.0,20.0,200.0,12.0)

// myDropdownList table view parameters
static const CGFloat X_TABLE_MARGIN								= 4.0;
static const CGFloat Y_TABLE_MARGIN								= 45.0;

// myDropDownList backgroud parameters
static const CGFloat X_BAKCGROUND_MARGIN						= -13.0;
static const CGFloat Y_BACKGROUND_MARGIN						= 0.0;
static const CGFloat BG_UNDER_TABLE_HEIGHT						= 20.0;

- (void) _initDropDownList
{
	// Create configuration object
	Configuration *config = [[[Configuration alloc] init] autorelease];
	
	myDropDownList=[[DropDownList alloc] initWithOrigin:MY_DROPDOWNLIST_ORIGIN
												ActiveImage:config.buttonActiveBG
										  WithInactiveImage:config.buttonNoActiveBG];
	
	myDropDownList.name = MY_DROPDOWNLIST_NAME;
	myDropDownList.type = MY_DROPDOWNLIST_TYPE;
	myDropDownList.buttonInstructionLabelFrame = BUTTON_INSTRUCTION_LABEL_FRAME;
	
	[myDropDownList setTopMainBG:config.openBGTop setMiddleBG:config.openBGMiddle setBottom:config.openBGBottom];
	
	[myDropDownList setCellBGImage:config.itemBG setCellBGHoverImage:config.itemBGHoved];
	
	[myDropDownList setBGXMargin:X_BAKCGROUND_MARGIN 
						   BGYMargin:Y_BACKGROUND_MARGIN 
				  BGUnderTableHeight:BG_UNDER_TABLE_HEIGHT];
	
	[myDropDownList setTableXMargin:X_TABLE_MARGIN TableYMargin:Y_TABLE_MARGIN];
	
	myDropDownList.cellDispAmount = ITEMS_NUMBER;
	
	// Make myDropDownList inactive by default
	[myDropDownList setUserInteractionEnabled:NO];
	
	// Set parent view controller
	myDropDownList.parentViewController = self;
}

- (void) _initDropDownListContent
{
	int itemsNumber = 26;
	dropDownListItems = [[NSMutableArray alloc] init];
	for (int i = 1; i <= itemsNumber; i++)
	{
		BaseItemObject *tempBaseItemObject = [[[BaseItemObject alloc] init] autorelease];
		BaseDataObject *tempBaseDataObject = [[[BaseDataObject alloc] init] autorelease];
		tempBaseDataObject.name = [NSString stringWithFormat:@"LEMBERG SOLUTIONS"];
		tempBaseDataObject.description = [NSString stringWithFormat:@"DESCRIPTION %i",i];
		tempBaseDataObject.image = [UIImage imageNamed:@"icon.png"];
		tempBaseItemObject.dataObject = tempBaseDataObject;
		[dropDownListItems addObject:tempBaseItemObject];
	}
}

- (void) _initLembergsLogo
{
	CGPoint logoOrigin = CGPointMake(10.0, 10.0);
	UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
	CGRect logoFrame = CGRectMake(logoOrigin.x, logoOrigin.y, logoImage.size.width/2, logoImage.size.height/2);
	UIImageView *logoView = [[[UIImageView alloc] initWithFrame:logoFrame] autorelease];
	[logoView setImage:logoImage];
	[self.view addSubview:logoView];
}
@end


