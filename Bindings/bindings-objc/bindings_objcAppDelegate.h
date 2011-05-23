//
//  bindings_objcAppDelegate.h
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 07-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyCheckBox;
@class MyTextField;

@interface bindings_objcAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow									*_window;

	NSTableView									*_tableView;

	NSArrayController							*_departmentsArrayController;
	NSArrayController							*_personsArrayController;
	
	NSTextField									*_nameField;
	NSTextField									*_ageField;
	MyCheckBox									*_founderCheckBox;
	NSPopUpButton								*_departmentPopUp;
}

@property (nonatomic, readwrite, retain) IBOutlet NSWindow *window;

@property (nonatomic, readwrite, retain) IBOutlet NSTableView *tableView;

@property (nonatomic, readonly, retain) NSArrayController *personsArrayController;
@property (nonatomic, readonly, retain) NSArrayController *departmentsArrayController;

@property (nonatomic, readwrite, retain) IBOutlet NSTextField *nameField;
@property (nonatomic, readwrite, retain) IBOutlet NSTextField *ageField;
@property (nonatomic, readwrite, retain) IBOutlet MyCheckBox *founderCheckBox;
@property (nonatomic, readwrite, retain) IBOutlet NSPopUpButton *departmentPopUp;

- (IBAction)toggleNameBinding:(id)theSender;
- (IBAction)toggleAgeBinding:(id)theSender;
- (IBAction)toggleFounderBinding:(id)theSender;
- (IBAction)toggleDepartmentBinding:(id)theSender;


@end
