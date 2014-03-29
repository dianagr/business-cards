#import "BusinessCard.h"

#import "BusinessCardsDataModel.h"

@interface BusinessCard ()

// Private interface goes here.

@end


@implementation BusinessCard

+ (BusinessCard *)businessCardFromJSONDictionary:(NSDictionary *)businessCardDictionary {
    NSManagedObjectContext *context = [[BusinessCardsDataModel sharedModel] mainObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];

    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", businessCardDictionary[@"first_name"]]; //TODO: handle nil.
    [fetchRequest setPredicate:predicate];

    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Could not fetch NSManagedObjects: %@", error.userInfo);
    }
    
    BusinessCard *businessCard;
    if ([fetchedObjects count] == 1) {
        businessCard = fetchedObjects.firstObject;
    }
    if (!fetchedObjects.lastObject) {
        businessCard = [BusinessCard insertInManagedObjectContext:context];
        businessCard.firstName = businessCardDictionary[@"first_name"];
        businessCard.lastName = businessCardDictionary[@"last_name"];
    }
    
    if (!businessCard) {
        NSLog(@"Could not create instance of type BusinessCard");
    }

    return businessCard;
}

@end
