//
//  MyViewController.m
//  collectionview
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyViewController.h"

#import "MyObject.h"

@implementation MyViewController

@synthesize collectionView = mCollectionView;
@synthesize	arrayController = mArrayController;

- (void)loadView
{
	[super loadView];
	
	NSMutableArray *content = [NSMutableArray array];
	for (NSUInteger i = 0; i < 10; i++) {
		MyObject *object = [[[MyObject alloc] init] autorelease];
		[object setName:[NSString stringWithFormat:@"%i", i]];
		[content addObject:object];
	}
	
	mArrayController = [[NSArrayController alloc] initWithContent:content];
	[mArrayController setAvoidsEmptySelection:YES];
	
	[[self collectionView] bind:@"content" toObject:[self arrayController] withKeyPath:@"arrangedObjects" options:nil];
	[[self collectionView] bind:@"selectionIndexes" toObject:[self arrayController] withKeyPath:@"selectionIndexes" options:nil];
}

- (NSString *)nibName
{
	return @"MyView";
}

- (void)keyDown:(NSEvent *)theEvent
{
	NSLog(@"%@ keyDown", self);
}

@end
