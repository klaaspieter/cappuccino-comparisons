/*
 * AppController.j
 * popupbutton-objj
 *
 * Created by You on January 28, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPWindow                                theWindow; //this "outlet" is connected automatically by the Cib

    @outlet CPPopUpButton                   mLeftPopUp @accessors(property=leftPopUp);
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    [[self leftPopUp] removeAllItems];

    for (var i = 0; i < 100; i++)
        [[self leftPopUp] addItemWithTitle:i.toString()];

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullBridge:YES];
}

@end
