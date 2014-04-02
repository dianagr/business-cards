//
//  BusinessCardDataSource.m
//  business-cards
//
//  Created by Diana Gren on 3/28/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardsDataSource.h"

#import "BusinessCardsDataModel.h"
#import "NSArray+Utils.h"

@interface BusinessCardsDataSource ()

@property (copy, nonatomic) NSMutableArray *mutableBusinessCards;

@end

@implementation BusinessCardsDataSource

- (id)init {
    if (self = [super init]) {
        _mutableBusinessCards = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadSavedData {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[BusinessCard entityName]];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObjectContext *context = [[BusinessCardsDataModel sharedModel] mainObjectContext];
    NSArray *fetchedData = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedData == nil) {
        NSLog(@"Error loading objects from context.");
    }

    [self.mutableBusinessCards addObjectsFromArray:fetchedData];
}

- (void)addBusinessCard:(BusinessCard *)businessCard {
    [self.mutableBusinessCards addObject:businessCard];
}

- (BusinessCard *)businessCardForIndex:(NSInteger)index {
    return [self.mutableBusinessCards objectMaybeNilAtIndex:index];
}

- (NSInteger)numberOfItems {
    return [self.mutableBusinessCards count];
}

- (void)setBusinessCards:(NSArray *)businessCards {
    _mutableBusinessCards = [businessCards mutableCopy];
}

@end
