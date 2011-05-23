//
//  keyequivalents_objcAppDelegate.h
//  keyequivalents-objc
//
//  Created by Klaas Pieter Annema on 23-05-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface keyequivalents_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
