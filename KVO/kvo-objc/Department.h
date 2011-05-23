//
//  Department.h
//  kvo-objc
//
//  Created by Klaas Pieter Annema on 26-04-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Department : NSObject {
	NSString						*mName;
}

@property (nonatomic, readwrite, retain) NSString *name;

@end
