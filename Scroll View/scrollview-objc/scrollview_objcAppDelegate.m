//
//  scrollview_objcAppDelegate.m
//  scrollview-objc
//
//  Created by Klaas Pieter Annema on 28-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "scrollview_objcAppDelegate.h"

@implementation scrollview_objcAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSScrollView *scrollView = [[[NSScrollView alloc] initWithFrame:CGRectZero] autorelease];
	NSLog(@"document view: %@", [scrollView documentView]);
}

@end
