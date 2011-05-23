//
//  menu_objcAppDelegate.h
//  menu-objc
//
//  Created by Klaas Pieter Annema on 19-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface menu_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;

	NSPopUpButton		*mPopUpButton;	
	BOOL				mRunning;
}

@property (assign) IBOutlet NSWindow *window;

@property (assign, getter=isRunning) BOOL running;
@property (assign) NSPopUpButton *popUpButton;

- (IBAction)start:(id)theSender;
//- (IBAction)stop:(id)theSender;

@end
