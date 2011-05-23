/*
 * AppController.j
 * textfield-objj
 *
 * Created by You on January 25, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@implementation AppController : CPObject
{
    CPWindow                            _mainWindow @accessors(property=mainWindow, readonly);
    CPWindow                            _sheetWindow @accessors(property=sheetWindow, readonly);
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    _mainWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];

    var button = [CPButton buttonWithTitle:@"Open sheet"];

    [button setTarget:self];
    [button setAction:@selector(openSheet:)];

    var contentView = [[self mainWindow] contentView];

    [contentView addSubview:button];
    [self _placeView:button inCenterOfView:contentView offset:CGPointMake(0.0, 5.0)];

    [self _setupWindow:[self mainWindow]];
    [[self mainWindow] orderFront:self];
}

- (void)openSheet:(id)theSender
{
    [CPApp beginSheet:[self sheetWindow]
       modalForWindow:[self mainWindow]
        modalDelegate:nil
       didEndSelector:nil
          contextInfo:nil];
}

- (void)closeSheet:(id)theSender
{
    [CPApp endSheet:[self sheetWindow]];
}

- (void)_setupWindow:(CPWindow)theWindow
{
    var contentView = [theWindow contentView],
        firstField = [CPTextField textFieldWithStringValue:@"" placeholder:@"" width:100.0];

    [firstField setStringValue:@"Hello, World!"];
    [firstField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [contentView addSubview:firstField];

    var firstFrame = [firstField frame],
        center = [contentView center],
        offset = CGPointMakeZero();

    offset.x = 0 - CGRectGetWidth(firstFrame) / 2.0;
    offset.y = 0 - CGRectGetHeight(firstFrame);

    [self _placeView:firstField inCenterOfView:contentView offset:offset];

    var secondField = [CPTextField textFieldWithStringValue:@"" placeholder:@"" width:100.0];

    [secondField setPlaceholderString:@"Hello, World!"];
    [secondField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [contentView addSubview:secondField];

    var offset = CGPointMakeZero(),
        secondFrame = [secondField frame];

    offset.x = CGRectGetWidth(secondFrame) / 2.0;
    offset.y = 0 - CGRectGetHeight(secondFrame);

    [self _placeView:secondField inCenterOfView:contentView offset:offset];

    [theWindow setInitialFirstResponder:secondField];
}

- (void)_placeView:(CPView)theSubview inCenterOfView:(CPView)theSuperview offset:(CGPoint)theOffset
{
    var bounds = [theSuperview bounds],
        frame = [theSubview frame];

    frame.origin.x = CGRectGetMidX(bounds) - (CGRectGetWidth(frame) / 2.0) + theOffset.x;
    frame.origin.y = CGRectGetMidY(bounds) - (CGRectGetHeight(frame) / 2.0) + theOffset.y;

    [theSubview setFrame:frame];
    [theSuperview addSubview:theSubview];
}

- (CPWindow)sheetWindow
{
    if (!_sheetWindow)
    {
        _sheetWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(0.0, 0.0, 350.0, 200.0) styleMask:CPDocModalWindowMask];
        [self _setupWindow:_sheetWindow];

        var contentView = [_sheetWindow contentView],
            dismissButton = [CPButton buttonWithTitle:@"Dismiss"];

        [dismissButton setTarget:self];
        [dismissButton setAction:@selector(closeSheet:)];
        [dismissButton setKeyEquivalent:CPEscapeFunctionKey];

        var contentBounds = [contentView bounds],
            buttonFrame = [dismissButton frame];

        buttonFrame.origin.x = CGRectGetMidX(contentBounds) - CGRectGetMidX(buttonFrame);
        buttonFrame.origin.y = CGRectGetMaxY(contentBounds) - CGRectGetHeight(buttonFrame) - 20.0;

        [dismissButton setFrame:buttonFrame];

        [contentView addSubview:dismissButton];
    }

    return _sheetWindow;
}

@end
