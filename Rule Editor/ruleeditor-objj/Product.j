@import <Foundation/CPObject.j>

@implementation Product : CPObject
{
    CPString                            mName @accessors(property=name);
    CPString                            mBrand @accessors(property=brand);
    CPDecimalNumber                     mPrice @accessors(property=price);
}

@end