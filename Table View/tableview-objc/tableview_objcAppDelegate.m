//
//  tableview_objcAppDelegate.m
//  tableview-objc
//
//  Created by Klaas Pieter Annema on 08-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "tableview_objcAppDelegate.h"

#define MyPrivateTableViewDataType @"MyPrivateTableViewDataType"

@implementation tableview_objcAppDelegate

@synthesize window = mWindow;
@synthesize tableView = mTableView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

	mData = [[NSMutableArray alloc] init];
	
	for (NSUInteger i = 0; i < 1000; i++)
		[mData addObject:[NSNumber numberWithInteger:i]];
	
	[[self tableView] registerForDraggedTypes:[NSArray arrayWithObject:MyPrivateTableViewDataType]];
	[[self tableView] reloadData];
}

#pragma mark -
#pragma mark NSTableViewDataSource
- (int)numberOfRowsInTableView:(NSTableView *)theTableView;
{
	return [mData count];
}

- (id)tableView:(NSTableView *)theTableView objectValueForTableColumn:(NSTableColumn *)theTableColumn row:(int)theRow;
{
	NSUInteger value = [[mData objectAtIndex:theRow] integerValue];
	return [NSString stringWithFormat:@"%i, %i", [[theTableView tableColumns] indexOfObject:theTableColumn], value];
}

- (BOOL)tableView:(NSTableView *)theTableView writeRowsWithIndexes:(NSIndexSet *)theRowIndexes toPasteboard:(NSPasteboard*)thePasteboard
{
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:theRowIndexes];
    [thePasteboard declareTypes:[NSArray arrayWithObject:MyPrivateTableViewDataType] owner:self];
    [thePasteboard setData:data forType:MyPrivateTableViewDataType];
    return YES;
}

- (NSDragOperation)tableView:(NSTableView *)theTableView 
				validateDrop:(id <NSDraggingInfo>)theDraggingInfo
				 proposedRow:(NSInteger)theRow
	   proposedDropOperation:(NSTableViewDropOperation)theOperation;
{
    // Add code here to validate the drop
    NSLog(@"validate Drop");
    return NSDragOperationEvery;
}

- (BOOL)tableView:(NSTableView *)theTableView acceptDrop:(id <NSDraggingInfo>)theDraggingInfo
			  row:(NSInteger)theRow dropOperation:(NSTableViewDropOperation)theOperation
{
    NSPasteboard* aPasteboard = [theDraggingInfo draggingPasteboard];
    NSData* aRowData = [aPasteboard dataForType:MyPrivateTableViewDataType];
    NSIndexSet* aRowIndexes = [NSKeyedUnarchiver unarchiveObjectWithData:aRowData];
    NSInteger aDrawRow = [aRowIndexes firstIndex];
	
	if (theRow < aDrawRow)
		theRow -= 1;
	
	NSArray *objects = [mData objectsAtIndexes:aRowIndexes];
	
	[mData removeObjectsAtIndexes:aRowIndexes];
	[mData insertObjects:objects atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(theRow, [aRowIndexes count])]];
	
	return YES;
}

#pragma mark -
#pragma mark Memory
- (void)dealloc
{
	[mData release];
	[super dealloc];
}

@end
