//
//  BusinessCardDataSource.h
//  business-cards
//
//  Created by Diana Gren on 3/28/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCard.h"

@interface BusinessCardsDataSource : NSObject

- (void)loadSavedData;
- (void)setBusinessCards:(NSArray *)businessCards;
- (void)addBusinessCard:(BusinessCard *)businessCard;

- (BusinessCard *)businessCardForIndex:(NSInteger)index;

- (NSInteger)numberOfItems;

@end
