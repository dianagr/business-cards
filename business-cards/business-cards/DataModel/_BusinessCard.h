// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BusinessCard.h instead.

#import <CoreData/CoreData.h>


extern const struct BusinessCardAttributes {
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} BusinessCardAttributes;

extern const struct BusinessCardRelationships {
} BusinessCardRelationships;

extern const struct BusinessCardFetchedProperties {
} BusinessCardFetchedProperties;






@interface BusinessCardID : NSManagedObjectID {}
@end

@interface _BusinessCard : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BusinessCardID*)objectID;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;






@end

@interface _BusinessCard (CoreDataGeneratedAccessors)

@end

@interface _BusinessCard (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




@end
