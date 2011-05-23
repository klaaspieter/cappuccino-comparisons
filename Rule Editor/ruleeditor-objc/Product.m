//
//  Product.m
//  ruleeditor-objc
//
//  Created by Klaas Pieter Annema on 12-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Product.h"


@implementation Product

@synthesize name = mName;
@synthesize brand = mBrand;
@synthesize price = mPrice;

- (void)dealloc
{
	[mName release];
	[mBrand release];
	[mPrice release];

	[super dealloc];
}

@end
