#import "BusinessCard.h"

#import "BusinessCardsDataModel.h"


@implementation BusinessCard

+ (BusinessCard *)businessCardFromJSONDictionary:(NSDictionary *)businessCardDictionary {
    NSManagedObjectContext *context = [[BusinessCardsDataModel sharedModel] mainObjectContext];
    
    BusinessCard *businessCard = [BusinessCard insertInManagedObjectContext:context];
    businessCard.firstName = businessCardDictionary[@"first_name"];
    businessCard.lastName = businessCardDictionary[@"last_name"];

    return businessCard;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
