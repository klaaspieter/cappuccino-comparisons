//
//  colorpanel_objcAppDelegate.h
//  colorpanel-objc
//
//  Created by Klaas Pieter Annema on 10-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface colorpanel_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow							*_window;

	NSBox								*_colorBox;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSBox *colorBox;

- (IBAction)orderFrontColorPanel:(id)theSender;

@end
