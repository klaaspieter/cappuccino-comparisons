/*
 * AppController.j
 * kvo-objj
 *
 * Created by You on April 26, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@import "Person.j"

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var person = [[Person alloc] init];
    [person setName:@"Klaas Pieter"];

    var department = [[Department alloc] init];
    [department setName:@"Development"];

    var building = [[Building alloc] init];
    [building setIdentifier:@"A1"];
    [department setBuilding:building];
    [person setDepartment:department];

    [person addObserver:self forKeyPath:@"department.handle" options:CPKeyValueObservingOptionNew context:nil];
    [person removeObserver:self forKeyPath:@"department.handle"];
    [person addObserver:self forKeyPath:@"department.handle" options:CPKeyValueObservingOptionNew context:nil];

    [building setIdentifier:@"B2"];
}

- (void)observeValueForKeyPath:(CPString)theKeyPath ofObject:(id)theObject change:(CPDictionary)theChanges context:(id)theContext
{
    CPLog.debug(@"observeValueForKeyPath: %@ ofObject: %@ change: %@", theKeyPath, theObject, theChanges);
}

@end
