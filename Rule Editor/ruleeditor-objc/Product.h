//
//  Product.h
//  ruleeditor-objc
//
//  Created by Klaas Pieter Annema on 12-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Product : NSObject {
	NSString						*mName;
	NSString						*mBrand;
	NSDecimalNumber					*mPrice;
}

@property (nonatomic, readwrite, retain) NSString *name;
@property (nonatomic, readwrite, retain) NSString *brand;
@property (nonatomic, readwrite, retain) NSDecimalNumber *price;

@end
