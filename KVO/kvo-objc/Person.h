//
//  Person.h
//  kvo-objc
//
//  Created by Klaas Pieter Annema on 26-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "Department.h"

@interface Person : NSObject {
	NSString						*mName;
	Department						*mDepartment;
}

@property (nonatomic, readwrite, retain) NSString *name;
@property (nonatomic, readwrite, retain) Department *department;

@end
