//
//  menu_objcAppDelegate.m
//  menu-objc
//
//  Created by Klaas Pieter Annema on 19-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "menu_objcAppDelegate.h"

@implementation menu_objcAppDelegate

@synthesize window;
@synthesize running = mRunning;
@synthesize popUpButton = mPopUpButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (BOOL)validateUserInterfaceItem:(id)theItem
{
	if ([theItem action] == @selector(start:))
		return ![self isRunning];
	else if ([theItem action] == @selector(cancel:))
		return [self isRunning];

	return YES;
}

- (IBAction)start:(id)theSender;
{
	[self setRunning:YES];
}

- (IBAction)cancel:(id)theSender;
{
	[self setRunning:NO];
}

@end
