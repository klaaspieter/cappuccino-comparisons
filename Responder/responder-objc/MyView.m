//
//  MyView.m
//  responder-objc
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"


@implementation MyView

- (void)keyDown:(NSEvent *)theEvent
{
	NSLog(@"%@ %@", self, NSStringFromSelector(_cmd));
	[self interpretKeyEvents:[NSArray arrayWithObject:theEvent]];
}
//
//- (void)insertText:(id)insertString
//{
//	NSLog(@"%@ %@ %@", self, NSStringFromSelector(_cmd), insertString);
//}
//
//- (void)insertNewline:(id)sender
//{
//	NSLog(@"%@ %@", self, NSStringFromSelector(_cmd));
//}

@end
