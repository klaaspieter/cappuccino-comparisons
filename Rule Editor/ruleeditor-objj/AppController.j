/*
 * AppController.j
 * null
 *
 * Created by You on April 12, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@import "Product.j"

@implementation AppController : CPObject
{
    @outlet CPWindow                        mWindow @accessors(property=window);

    @outlet CPTableView                     mTableView @accessors(property=tableView);
    @outlet CPPredicateEditor               mPredicateEditor @accessors(property=predicateEditor);
    
    CPArrayController                       mProductsArrayController @accessors(property=productsArrayController);
}

- (void)awakeFromCib
{
    var products = [],
        product1 = [[Product alloc] init];

    [product1 setName:@"A Clock."];
    [product1 setBrand:@"Bhaise Ick"];
    [product1 setPrice:[CPDecimalNumber decimalNumberWithString:@"49.90"]];
    [products addObject:product1];

    var product2 = [[Product alloc] init];
    [product2 setName:@"Aqua"];
    [product2 setBrand:@"Swérzio Armanwa"];
    [product2 setPrice:[CPDecimalNumber decimalNumberWithString:@"53.50"]];
    [products addObject:product2];

    mProductsArrayController = [[CPArrayController alloc] initWithContent:products];

    [[self tableView] bind:@"content" toObject:[self productsArrayController] withKeyPath:@"arrangedObjects" options:nil];

    var nameColumn = [[self tableView] tableColumnWithIdentifier:@"name"];
    [nameColumn bind:CPValueBinding toObject:[self productsArrayController] withKeyPath:@"arrangedObjects.name" options:nil];
    var brandColumn = [[self tableView] tableColumnWithIdentifier:@"brand"];
    [brandColumn bind:CPValueBinding toObject:[self productsArrayController] withKeyPath:@"arrangedObjects.brand" options:nil];
    var priceColumn = [[self tableView] tableColumnWithIdentifier:@"price"];
    [priceColumn bind:CPValueBinding toObject:[self productsArrayController] withKeyPath:@"arrangedObjects.price" options:nil];

    var sPredicate = [CPPredicate predicateWithFormat:@"name contains[cd] 'A'"];
    [[self productsArrayController] setFilterPredicate:sPredicate];

    // [[self predicateEditor] bind:CPValueBinding toObject:[self productsArrayController] withKeyPath:@"filterPredicate" options:nil];
    [[self predicateEditor] setObjectValue:sPredicate];

    [[self window] setFullPlatformWindow:YES];
}

- (void)updatePredicate:(id)theSender
{
    [[self productsArrayController] setFilterPredicate:[theSender objectValue]];
}

@end
