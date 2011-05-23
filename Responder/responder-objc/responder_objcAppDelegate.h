//
//  responder_objcAppDelegate.h
//  responder-objc
//
//  Created by Klaas Pieter Annema on 20-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface responder_objcAppDelegate : NSResponder <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
