/*
 * AppController.j
 * collectionview-objj
 *
 * Created by You on May 31, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib

    @outlet CPCollectionView                _collectionView @accessors(property=collectionView, readonly);
}

- (void)awakeFromCib
{
    var content = [];
    for (var i = 0 ; i < 100; i++)
        [content addObject:i];

    [[self collectionView] setContent:content];

    [theWindow setFullPlatformWindow:YES];
}

- (@action)clearContent:(id)theSender
{
    [[self collectionView] setContent:[]];
}

@end
