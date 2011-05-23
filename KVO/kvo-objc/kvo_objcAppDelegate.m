//
//  kvo_objcAppDelegate.m
//  kvo-objc
//
//  Created by Klaas Pieter Annema on 26-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "kvo_objcAppDelegate.h"

#import "Person.h"

@implementation kvo_objcAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	Person *person = [[[Person alloc] init] autorelease];
	
	[person setName:@"Klaas Pieter"];

	Department *department = [[[Department alloc] init] autorelease];
	[department setName:@"Development"];
	[person setDepartment:department];

	[person addObserver:self forKeyPath:@"department.name" options:NSKeyValueObservingOptionNew context:nil];

	Department *newDepartment = [[[Department alloc] init] autorelease];
	[newDepartment setName:@"Engineering"];
	[person setDepartment:newDepartment];
	
	[newDepartment setName:@"Test"];

//	[person removeObserver:self forKeyPath:@"department.name"];
}

- (void)observeValueForKeyPath:(NSString *)theKeyPath ofObject:(id)theObject change:(NSDictionary *)theChanges context:(void *)theContext
{
	NSLog(@"observeValueForKeyPath: %@ ofObject: %@ change: %@", theKeyPath, theObject, theChanges);
}

@end
