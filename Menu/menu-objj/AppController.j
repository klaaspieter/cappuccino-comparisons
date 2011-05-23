/*
 * AppController.j
 * menu-objj
 *
 * Created by You on April 19, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@import "MyMenu.j"

@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib

    BOOL        mRunning @accessors(property=running, getter=isRunning);
}

- (BOOL)validateMenuItem:(id)theItem
{
    if ([theItem action] == @selector(start:))
        return ![self isRunning];
    else if ([theItem action] == @selector(stop:))
        return [self isRunning];

    return YES;
}

- (@action)performFindPanelAction:(id)theSender
{
    CPLog.debug(@"...");
}

- (void)start:(id)theSender
{
    [self setRunning:YES];
}

- (void)stop:(id)theSender
{
    [self setRunning:NO];
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

@end
