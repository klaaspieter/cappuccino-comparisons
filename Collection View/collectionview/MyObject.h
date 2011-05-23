//
//  MyObject.h
//  collectionview
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MyObject : NSView {
	NSString						*mName;
}

@property (nonatomic, readwrite, retain) NSString *name;

@end
