//
//  collectionviewAppDelegate.m
//  collectionview
//
//  Created by Klaas Pieter Annema on 15-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "collectionviewAppDelegate.h"

#import "MyViewController.h"

@implementation collectionviewAppDelegate

@synthesize window = mWindow;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	mViewController = [[MyViewController alloc] init];

	NSView *contentView = [[self window] contentView];
	[[mViewController view] setFrame:[contentView bounds]];
	[contentView addSubview:[mViewController view]];

	[[self window] setNextResponder:mViewController];
}

- (void)dealloc
{
	[super dealloc];

	[mViewController release];
}

@end
