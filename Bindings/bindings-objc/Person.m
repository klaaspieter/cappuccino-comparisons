//
//  Person.m
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 07-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import "Person.h"

#import "Department.h"

@implementation Person

@synthesize name = _name;
@synthesize age = _age;
@synthesize isFounder = _isFounder;
@synthesize department = _department;

+ (id)personWithName:(NSString *)theName age:(NSUInteger)theAge isFounder:(BOOL)isFounder department:(Department *)theDepartment;
{
	return [[[self alloc] initWithName:theName age:(NSUInteger)theAge isFounder:isFounder department:theDepartment] autorelease];
}

- (id)initWithName:(NSString *)theName age:(NSUInteger)theAge isFounder:(BOOL)isFounder department:(Department *)theDepartment;
{
	if (self = [super init]) {
		_name = [theName copy];
		_age = theAge;
		_isFounder = isFounder; 
		_department = [theDepartment retain];
	}
	
	return self;
}

- (void)setValue:(id)theValue forKey:(NSString *)theKey
{
	[super setValue:theValue forKey:theKey];

	NSLog(@"%@ setValue: %@ forKey: %@", self, theValue, theKey);
}

- (void)setIsFounder:(BOOL)isFounder
{
	NSLog(@"%@ setIsFounder: %i", self, isFounder);
	_isFounder = isFounder;
}

- (void)dealloc
{
	[_name release];
	[_department release];

	[super dealloc];
}


@end
