@import "Building.j"

@implementation Department : CPObject
{
    CPString                        mName @accessors(property=name);
    Building                        mBuilding @accessors(property=building);
}

+ (CPSet)keyPathsForValuesAffectingHandle
{
    return [CPSet setWithArray:[@"building.identifier"]];
}

- (CPString)handle
{
    return [[[self building] identifier] lowercaseString];
}

@end