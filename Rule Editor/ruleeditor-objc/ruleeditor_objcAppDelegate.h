//
//  ruleeditor_objcAppDelegate.h
//  ruleeditor-objc
//
//  Created by Klaas Pieter Annema on 12-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ruleeditor_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow							*mWindow;
	NSTableView							*mTableView;
	
	NSArrayController					*mProductsArrayController;
	
	NSPredicateEditor					*mPredicateEditor;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTableView *tableView;

@property (nonatomic, readonly, retain) NSArrayController *productsArrayController;

@property (assign) IBOutlet NSPredicateEditor *predicateEditor;
@property (assign) IBOutlet NSTextField *predicateField;

@end
