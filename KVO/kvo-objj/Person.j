@import "Department.j"

@implementation Person : CPObject
{
    CPString                    mName @accessors(property=name);
    Department                  mDepartment @accessors(property=department);
}

// - (void)willChangeValueForKey:(CPString)theKey
// {
//     debugger;
// }

@end