@import <Foundation/CPObject.j>

@import "Department.j"

@implementation Person : CPObject
{
    CPString                            _name @accessors(property=name);
    int                                 _age @accessors(property=age);

    BOOL                                _isFounder @accessors(property=isFounder);

    Department                          _department @accessors(property=department);
}

+ (id)personWithName:(CPString)theName age:(int)theAge isFounder:(BOOL)isFounder department:(Department)theDepartment
{
    return [[self alloc] initWithName:theName age:theAge isFounder:isFounder department:theDepartment];
}

- (id)initWithName:(CPString)theName age:(int)theAge isFounder:(BOOL)isFounder department:(Department)theDepartment;
{
    if (self = [super init])
    {
        _name = theName;
        _age = theAge;
        _isFounder = isFounder;
        _department = theDepartment;
    }

    return self;
}

@end