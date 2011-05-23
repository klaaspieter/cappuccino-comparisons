//
//  tableview_objcAppDelegate.h
//  tableview-objc
//
//  Created by Klaas Pieter Annema on 08-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface tableview_objcAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow							*mWindow;
	NSTableView							*mTableView;

	NSMutableArray						*mData;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTableView *tableView;

@end
