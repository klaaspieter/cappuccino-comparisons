//
//  responder_objcAppDelegate.m
//  responder-objc
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "responder_objcAppDelegate.h"

@implementation responder_objcAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//	NSLog(@"%@", [NSApp nextResponder]);
	[NSApp setNextResponder:self];
}

- (void)keyDown:(NSEvent *)theEvent
{
	if (theEvent == [[NSEvent alloc] init])
	{
		
	}
	
	NSLog(@"keyDown");
}

- (void)cancelOperation:(id)sender
{
	NSLog(@"CANCEL");
}

@end
