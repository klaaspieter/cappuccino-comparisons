/*
 * AppController.j
 * colorpanel-objj
 *
 * Created by You on January 10, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    @outlet CPWindow                                _mainWindow @accessors(property=mainWindow, readonly);

    @outlet CPBox                                   _colorBox @accessors(property=colorBox, readonly);
}
- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
    
    // In this case, we want the window from Cib to become our full browser window

    [[CPColorPanel sharedColorPanel] orderFront:self];
    [[self mainWindow] setFullBridge:YES];
}

- (void)changeColor:(id)theSender
{
	[[self colorBox] setFillColor:[theSender color]];
}

@end
