//
//  BusinessCardViewController.h
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

@class BusinessCardsDataSource;
@interface BusinessCardListViewController : UITableViewController

- (instancetype)initWithDataSource:(BusinessCardsDataSource *)dataSource;

@end
