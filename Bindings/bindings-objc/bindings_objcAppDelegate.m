//
//  bindings_objcAppDelegate.m
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 07-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import "bindings_objcAppDelegate.h"

#import "Person.h"
#import "Department.h"
#import "MyCheckBox.h"
#import "MyTextField.h"

@implementation bindings_objcAppDelegate

@synthesize window = _window;
@synthesize tableView = _tableView;

@synthesize personsArrayController = _personsArrayController;
@synthesize departmentsArrayController = _departmentsArrayController;

@synthesize nameField = _nameField;
@synthesize ageField = _ageField;
@synthesize founderCheckBox = _founderCheckBox;
@synthesize departmentPopUp = _departmentPopUp;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	Department *designDepartment = [Department departmentWithName:@"Design"];
	Department *engineeringDepartment = [Department departmentWithName:@"Engineering"];
	
	_departmentsArrayController = [[NSArrayController alloc] initWithContent:[NSArray arrayWithObjects:designDepartment, engineeringDepartment, nil]];
	
	_personsArrayController = [[NSArrayController alloc] initWithContent:[NSArray arrayWithObjects:
																		  [Person personWithName:@"Klaas Pieter" age:24 isFounder:NO department:engineeringDepartment],
																		  [Person personWithName:@"Koen" age:28 isFounder:YES department:engineeringDepartment],
																		  [Person personWithName:@"Dirk" age:30 isFounder:YES department:engineeringDepartment],
																		  [Person personWithName:@"Joy-Vincent" age:24 isFounder:NO department:designDepartment],
																		  [Person personWithName:@"Pieter" age:26 isFounder:NO department:engineeringDepartment],
																		  [Person personWithName:@"Jorn" age:28 isFounder:NO department:designDepartment],
																		  [Person personWithName:@"Jasper" age:30 isFounder:YES department:designDepartment],
																		  nil]];
	[[self personsArrayController] setAvoidsEmptySelection:NO];
	[[self personsArrayController] setSelectionIndexes:[NSIndexSet indexSet]];
	[[self personsArrayController] setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
	
	[[self tableView] bind:@"content" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects" options:nil];
	[[self tableView] bind:@"selectionIndexes" toObject:[self personsArrayController] withKeyPath:@"selectionIndexes" options:nil];
	[[self tableView] bind:@"sortDescriptors" toObject:[self personsArrayController] withKeyPath:@"sortDescriptors" options:nil];

	NSObject *object = nil;
	[object bind:@"" toObject:nil withKeyPath:@"arrangedObjects" options:nil];
	
	NSTableColumn *nameColumn = [[self tableView] tableColumnWithIdentifier:@"name"];
	[nameColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.name" options:nil];
	[[self nameField] bind:@"value" toObject:[self personsArrayController] withKeyPath:@"selection.name" options:[NSDictionary dictionaryWithObject:(id)kCFBooleanFalse forKey:NSConditionallySetsEditableBindingOption]];

	NSTableColumn *ageColumn = [[self tableView] tableColumnWithIdentifier:@"age"];
	[ageColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.age" options:nil];
	[[self ageField] bind:@"value" toObject:[self personsArrayController] withKeyPath:@"selection.age" options:[NSDictionary dictionaryWithObject:(id)kCFBooleanFalse forKey:NSConditionallySetsEditableBindingOption]];
	
	NSTableColumn *founderColumn = [[self tableView] tableColumnWithIdentifier:@"founder"];
	[founderColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.isFounder" options:nil];
	[[self founderCheckBox] bind:@"value" toObject:[self personsArrayController] withKeyPath:@"selection.isFounder" options:[NSDictionary dictionaryWithObject:(id)kCFBooleanFalse forKey:NSConditionallySetsEnabledBindingOption]];

	NSTableColumn *departmentColumn = [[self tableView] tableColumnWithIdentifier:@"department"];
	[departmentColumn bind:@"value" toObject:[self personsArrayController] withKeyPath:@"arrangedObjects.department.name" options:nil];

	[[self departmentPopUp] bind:@"content" toObject:[self departmentsArrayController] withKeyPath:@"arrangedObjects" options:nil];
//	[[self departmentPopUp] bind:@"contentValues" toObject:[self departmentsArrayController] withKeyPath:@"arrangedObjects.name" options:nil];
//	[[self departmentPopUp] bind:@"selectedObject" toObject:[self personsArrayController] withKeyPath:@"selection.department" options:nil];
}

- (IBAction)toggleNameBinding:(id)theSender;
{
	NSDictionary *bindingInfo = [[self nameField] infoForBinding:NSValueBinding];

	if (!bindingInfo)
		[[self nameField] bind:NSValueBinding toObject:[self personsArrayController] withKeyPath:@"selection.name" options:[NSDictionary dictionaryWithObject:(id)kCFBooleanFalse forKey:NSConditionallySetsEditableBindingOption]];
	else
		[[self nameField] unbind:NSValueBinding];
}

- (IBAction)toggleAgeBinding:(id)theSender;
{
	NSDictionary *bindingInfo = [[self ageField] infoForBinding:NSValueBinding];
	
	if (!bindingInfo)
		[[self ageField] bind:NSValueBinding toObject:[self personsArrayController] withKeyPath:@"selection.age" options:[NSDictionary dictionaryWithObject:(id)kCFBooleanFalse forKey:NSConditionallySetsEditableBindingOption]];
	else
		[[self ageField] unbind:NSValueBinding];
}

- (IBAction)toggleFounderBinding:(id)theSender;
{
	NSDictionary *bindingInfo = [[self founderCheckBox] infoForBinding:NSValueBinding];
	
	if (!bindingInfo)
		[[self founderCheckBox] bind:NSValueBinding toObject:[self personsArrayController] withKeyPath:@"selection.isFounder" options:[NSDictionary dictionaryWithObject:(id)kCFBooleanFalse forKey:NSConditionallySetsEnabledBindingOption]];
	else
		[[self founderCheckBox] unbind:NSValueBinding];
}

- (IBAction)toggleDepartmentBinding:(id)theSender
{
	NSDictionary *bindingInfo = [[self departmentPopUp] infoForBinding:@"selectedObject"];
	
	if (!bindingInfo) {
		[[self departmentPopUp] bind:@"selectedObject" toObject:[self personsArrayController] withKeyPath:@"selection.department" options:nil];
	} else {
		[[self departmentPopUp] unbind:@"selectedObject"];
	}


}

- (void)dealloc
{
	[_window release];
	[_tableView release];
	[_personsArrayController release];
	[_departmentsArrayController release];
	[_nameField release];
	[_ageField release];
	[_founderCheckBox release];
	
	[super dealloc];
}

@end
