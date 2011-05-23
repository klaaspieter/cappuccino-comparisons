//
//  ruleeditor_objcAppDelegate.m
//  ruleeditor-objc
//
//  Created by Klaas Pieter Annema on 12-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ruleeditor_objcAppDelegate.h"

#import "Product.h"

@implementation ruleeditor_objcAppDelegate

@synthesize window = mWindow;

@synthesize tableView = mTableView;

@synthesize productsArrayController = mProductsArrayController;

@synthesize predicateEditor = mPredicateEditor;
@synthesize predicateField = mPredicateField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	NSMutableArray *products = [NSMutableArray array];
	
	Product *product1 = [[Product alloc] init];
	[product1 setName:@"A Clock."];
	[product1 setBrand:@"Bhaise Ick"];
	[product1 setPrice:[NSDecimalNumber decimalNumberWithString:@"49.90"]];
	[products addObject:product1];

	Product *product2 = [[Product alloc] init];
	[product2 setName:@"Aqua"];
	[product2 setBrand:@"Swérzio Armanwa"];
	[product2 setPrice:[NSDecimalNumber decimalNumberWithString:@"53.50"]];
	[products addObject:product2];
	
	mProductsArrayController = [[NSArrayController alloc] initWithContent:products];

	[[self tableView] bind:@"content" toObject:[self productsArrayController] withKeyPath:@"arrangedObjects" options:nil];
	
	NSTableColumn *nameColumn = [[self tableView] tableColumnWithIdentifier:@"name"];
	[nameColumn bind:NSValueBinding toObject:[self productsArrayController] withKeyPath:@"arrangedObjects.name" options:nil];
	NSTableColumn *brandColumn = [[self tableView] tableColumnWithIdentifier:@"brand"];
	[brandColumn bind:NSValueBinding toObject:[self productsArrayController] withKeyPath:@"arrangedObjects.brand" options:nil];
	NSTableColumn *priceColumn = [[self tableView] tableColumnWithIdentifier:@"price"];
	[priceColumn bind:NSValueBinding toObject:[self productsArrayController] withKeyPath:@"arrangedObjects.price" options:nil];
	
	NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"brand contains[cd] 'A' AND name contains[cd] 'A' AND price > 10"];
	[[self productsArrayController] setFilterPredicate:sPredicate];

	
	[[self predicateEditor] bind:NSValueBinding toObject:[self productsArrayController] withKeyPath:@"filterPredicate" options:nil];

	NSLog(@"%@", [[self predicateEditor] rowTemplates]);
}

- (void)dealloc
{
	[mProductsArrayController release];
	
	[super dealloc];
}

@end