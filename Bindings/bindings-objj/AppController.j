/*
 * AppController.j
 * checkbox-binding
 *
 * Created by You on January 6, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@import "Person.j"
@import "Department.j"

@implementation AppController : CPObject
{
    @outlet CPWindow                            _mainWindow @accessors(property=mainWindow, readonly);
    @outlet CPTableView                         _tableView @accessors(property=tableView, readonly);
    
    @outlet CPTextField                         _nameField @accessors(property=nameField, readonly);
    @outlet CPTextField                         _ageField @accessors(property=ageField, readonly);
    @outlet CPCheckBox                          _founderCheckBox @accessors(property=founderCheckBox, readonly);
    @outlet CPPopUpButton                       _departmentPopUp @accessors(property=departmentPopUp, readonly);
    
    CPArrayController                           _personsArrayController @accessors(property=personsArrayController);
    CPArrayController                           _departmentsArrayController @accessors(property=departmentsArrayController);
}

- (void)awakeFromCib
{
    var designDepartment = [Department departmentWithName:@"Design"],
        engineeringDepartment = [Department departmentWithName:@"Engineering"];

    _departmentsArrayController = [[CPArrayController alloc] initWithContent:[designDepartment,engineeringDepartment]];

    _personsArrayController = [[CPArrayController alloc] initWithContent:[
        [Person personWithName:@"Klaas Pieter" age:24 isFounder:NO department:engineeringDepartment],
        [Person personWithName:@"Koen" age:28 isFounder:YES department:engineeringDepartment],
        [Person personWithName:@"Dirk" age:30 isFounder:YES department:engineeringDepartment],
        [Person personWithName:@"Joy-Vincent" age:24 isFounder:NO department:designDepartment],
        [Person personWithName:@"Pieter" age:26 isFounder:NO department:engineeringDepartment],
        [Person personWithName:@"Jorn" age:28 isFounder:NO department:designDepartment],
        [Person personWithName:@"Jasper" age:30 isFounder:YES department:designDepartment]
    ]];

    [[self tableView] bind:@"content" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects" options:nil];

    var nameColumn = [[self tableView] tableColumnWithIdentifier:@"name"];
    [nameColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.name" options:nil];
    [[self nameField] bind:@"value" toObject:[self personsArrayController] withKeyPath:@"selection.name" options:nil];

    var ageColumn = [[self tableView] tableColumnWithIdentifier:@"age"];
    [ageColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.age" options:nil];
    [[self ageField] bind:@"value" toObject:[self personsArrayController] withKeyPath:@"selection.age" options:nil];

    [[self founderCheckBox] setAllowsMixedState:NO];

    var founderColumn = [[self tableView] tableColumnWithIdentifier:@"founder"];
    [founderColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.isFounder" options:nil];
    [[self founderCheckBox] bind:@"value" toObject:[self personsArrayController] withKeyPath:@"selection.isFounder" options:nil];

    var departmentColumn = [[self tableView] tableColumnWithIdentifier:@"department"];
    [departmentColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.department.name" options:nil];

    // Not supported yet
    // [[self departmentPopUp] bind:@"content" toObject:[self departmentsArrayController] withKeyPath:@"arrangedObjects" options:nil];
    // [[self departmentPopUp] bind:@"contentValues" toObject:[self departmentsArrayController] withKeyPath:@"arrangedObjects.name" options:nil];
    // [[self departmentPopUp] bind:@"selectedObject" toObject:[self personsArrayController] withKeyPath:@"selection.department" options:nil];

    [[self mainWindow] setFullBridge:YES];
}

- (@action)toggleNameBinding:(id)theSender
{
    var bindingInfo = [[self nameField] infoForBinding:CPValueBinding];

    if (!bindingInfo)
        [[self nameField] bind:CPValueBinding toObject:[self personsArrayController] withKeyPath:@"selection.name" options:nil];
    else
        [[self nameField] unbind:CPValueBinding];
}

- (@action)toggleAgeBinding:(id)theSender
{
    var bindingInfo = [[self ageField] infoForBinding:CPValueBinding];

    if (!bindingInfo)
        [[self ageField] bind:CPValueBinding toObject:[self personsArrayController] withKeyPath:@"selection.age" options:nil];
    else
        [[self ageField] unbind:CPValueBinding];
}

- (@action)toggleFounderBinding:(id)theSender
{
    var bindingInfo = [[self founderCheckBox] infoForBinding:CPValueBinding];

    if (!bindingInfo)
        [[self founderCheckBox] bind:CPValueBinding toObject:[self personsArrayController] withKeyPath:@"selection.isFounder" options:nil];
    else
        [[self founderCheckBox] unbind:CPValueBinding];
}

- (BOOL)tableView:(CPTableView)theTableView shouldEditTableColumn:(CPTableColumn)theTableColumn row:(int)theRow
{
    CPLog.debug(@"...");
    return YES;
}

- (void)tableView:(CPTableView)theTableView setObjectValue:(id)theValue forTableColumn:(CPTableColumn)theTableColumn row:(int)theRow
{
    CPLog.debug(@"...");
}

@end