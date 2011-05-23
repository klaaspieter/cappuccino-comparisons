//
//  Department.h
//  bindings-objc
//
//  Created by Klaas Pieter Annema on 26-01-11.
//  Copyright 2011 Sofa BV. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Department : NSObject <NSCopying> {
	NSString				*_name;
}

@property (nonatomic, readwrite, copy) NSString *name;

+ (id)departmentWithName:(NSString *)theName;
- (id)initWithName:(NSString *)theName;

@end
