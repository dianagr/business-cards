//
//  BusinessCardListViewControllerTest.m
//  business-cards
//
//  Created by Diana Gren on 3/28/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import <GHUnit/GHUnit.h>

#import "BusinessCardListViewController.h"
#import "BusinessCardsDataSource.h"

@interface BusinessCardListViewControllerTest : GHViewTestCase

@end

@implementation BusinessCardListViewControllerTest

- (CGSize)sizeForView:(UIView *)view {
    return CGSizeMake(320, 568);
}

// TODO: Fic this test, setup managed object context for text environment.
- (void)testView {
    BusinessCardListViewController *businessCardListViewController = [[BusinessCardListViewController alloc] init];
    
    BusinessCardsDataSource *dataSource = [[BusinessCardsDataSource alloc] init];
    
    [businessCardListViewController.view layoutIfNeeded];
    GHVerifyView(businessCardListViewController.view);
}

@end
