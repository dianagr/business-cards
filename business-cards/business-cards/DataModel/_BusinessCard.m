// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BusinessCard.m instead.

#import "_BusinessCard.h"

const struct BusinessCardAttributes BusinessCardAttributes = {
	.email = @"email",
	.firstName = @"firstName",
	.lastName = @"lastName",
};

const struct BusinessCardRelationships BusinessCardRelationships = {
};

const struct BusinessCardFetchedProperties BusinessCardFetchedProperties = {
};

@implementation BusinessCardID
@end

@implementation _BusinessCard

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BusinessCard" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BusinessCard";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BusinessCard" inManagedObjectContext:moc_];
}

- (BusinessCardID*)objectID {
	return (BusinessCardID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic email;






@dynamic firstName;






@dynamic lastName;











@end
