//
//  Person.m
//  kvo-objc
//
//  Created by Klaas Pieter Annema on 26-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name = mName;
@synthesize department = mDepartment;

- (void)willChangeValueForKey:(NSString *)key
{
	NSLog(@"%@ willChangeValueForKey: %@", self, key);
}

- (void)dealloc
{
	[mName release];
	[mDepartment release];
	[super dealloc];
}

@end
