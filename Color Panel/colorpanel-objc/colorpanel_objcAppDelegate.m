//
//  colorpanel_objcAppDelegate.m
//  colorpanel-objc
//
//  Created by Klaas Pieter Annema on 10-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import "colorpanel_objcAppDelegate.h"

@implementation colorpanel_objcAppDelegate

@synthesize window = _window;
@synthesize colorBox = _colorBox;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[[self colorBox] setFillColor:[[NSColorPanel sharedColorPanel] color]];
}

- (IBAction)orderFrontColorPanel:(id)theSender
{
	[[NSColorPanel sharedColorPanel] orderFront:theSender];
}

- (void)changeColor:(id)theSender
{
	[[self colorBox] setFillColor:[theSender color]];
}

@end
