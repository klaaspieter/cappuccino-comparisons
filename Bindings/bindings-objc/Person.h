//
//  Person.h
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 07-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Department;

@interface Person : NSObject {

	NSString						*_name;
	NSUInteger						_age;
	
	BOOL							_isFounder;
	Department						*_department;
}

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, assign) NSUInteger age;

@property (nonatomic, readwrite, assign) BOOL isFounder;
@property (nonatomic, readwrite, retain) Department *department;

+ (id)personWithName:(NSString *)theName age:(NSUInteger)theAge isFounder:(BOOL)isFounder department:(Department *)theDepartment;
- (id)initWithName:(NSString *)theName age:(NSUInteger)theAge isFounder:(BOOL)isFounder department:(Department *)theDepartment;


@end
