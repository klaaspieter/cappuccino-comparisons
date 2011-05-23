//
//  popupbutton_objcAppDelegate.m
//  popupbutton-objc
//
//  Created by Klaas Pieter Annema on 28-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import "popupbutton_objcAppDelegate.h"

@implementation popupbutton_objcAppDelegate

@synthesize window = mWindow;
@synthesize leftPopUp = mLeftPopUp;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

	[[self leftPopUp] removeAllItems];

	[[[self leftPopUp] menu] itemAtIndex:5];
//	NSLog(@"%@", [[self leftPopUp] itemWithTitle:@"Non existing title"]);
}

@end
