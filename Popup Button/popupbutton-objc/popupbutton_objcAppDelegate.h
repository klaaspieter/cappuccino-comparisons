//
//  popupbutton_objcAppDelegate.h
//  popupbutton-objc
//
//  Created by Klaas Pieter Annema on 28-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface popupbutton_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow						*mWindow;
	NSPopUpButton					*mLeftPopUp;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSPopUpButton *leftPopUp;

@end
