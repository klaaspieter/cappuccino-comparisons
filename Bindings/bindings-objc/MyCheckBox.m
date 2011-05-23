//
//  MyCheckBox.m
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 07-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import "MyCheckBox.h"


@implementation MyCheckBox


- (void)setValue:(id)theValue forKey:(NSString *)theKey
{
	[super setValue:theValue forKey:theKey];

	NSLog(@"%@ setValue: %@ forKey: %@", self, theValue, theKey);
}

- (void)setState:(NSInteger)theState
{
	[super setState:theState];

	NSLog(@"%i", theState);
}

- (void)setAllowsMixedState:(BOOL)flag
{
	[super setAllowsMixedState:flag];

	NSLog(@"%@ setAllowsMixedState: %i", self, flag);
}

@end
