//
//  Department.m
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 26-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import "Department.h"


@implementation Department

@synthesize name = _name;

+ (id)departmentWithName:(NSString *)theName;
{
	return [[[self alloc] initWithName:theName] autorelease];
}

- (id)initWithName:(NSString *)theName;
{
	if (self = [super init]) {
		_name = [theName copy];
	}
	
	return self;
}

- (void)dealloc
{
	[_name release];
	
	[super dealloc];
}

@end
