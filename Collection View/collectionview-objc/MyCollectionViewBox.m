//
//  MyCollectionViewBox.m
//  collectionview
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyCollectionViewBox.h"


@implementation MyCollectionViewBox

// -------------------------------------------------------------------------------
//	hitTest:aPoint
// -------------------------------------------------------------------------------
- (NSView *)hitTest:(NSPoint)aPoint
{
    // don't allow any mouse clicks for subviews in this NSBox
    return nil;
}

- (void)keyDown:(NSEvent *)theEvent
{
	NSLog(@"%@ keyDown", self);
}

@end
