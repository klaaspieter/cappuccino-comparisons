//
//  scrollview_objcAppDelegate.h
//  scrollview-objc
//
//  Created by Klaas Pieter Annema on 28-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface scrollview_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
