//
//  MyViewController.h
//  collectionview
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MyViewController : NSViewController {
	NSCollectionView				*mCollectionView;
	
	NSArrayController				*mArrayController;
}

@property (assign) IBOutlet NSCollectionView *collectionView;

@property (assign) NSArrayController *arrayController;


@end
