//
//  Department.m
//  kvo-objc
//
//  Created by Klaas Pieter Annema on 26-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Department.h"


@implementation Department

@synthesize name = mName;

- (void)dealloc
{
	[mName release];
	[super dealloc];
}

@end
