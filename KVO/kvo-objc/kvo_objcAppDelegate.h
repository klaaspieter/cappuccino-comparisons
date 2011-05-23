//
//  kvo_objcAppDelegate.h
//  kvo-objc
//
//  Created by Klaas Pieter Annema on 26-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface kvo_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
