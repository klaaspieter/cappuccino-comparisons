//
//  collectionviewAppDelegate.h
//  collectionview
//
//  Created by Klaas Pieter Annema on 15-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyViewController;

@interface collectionviewAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow						*mWindow;
	MyViewController				*mViewController;
}

@property (assign) IBOutlet NSWindow *window;

@end
