//
//  BusinessCardViewController.m
//  business-cards
//
//  Created by Diana Gren on 3/28/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardViewController.h"

#import "BusinessCard.h"
#import "BusinessCardView.h"

@interface BusinessCardViewController ()
@property (strong, nonatomic) BusinessCardView *businessCardView;
@end

@implementation BusinessCardViewController

- (void)loadView {
    [super loadView];
    self.view = self.businessCardView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.businessCardView.businessCard = self.businessCard;
}

- (BusinessCardView *)businessCardView {
    if (!_businessCardView) {
        _businessCardView = [[BusinessCardView alloc] initWithFrame:self.view.frame];
    }
    return _businessCardView;
}

- (void)setBusinessCard:(BusinessCard *)businessCard {
    _businessCard = businessCard;
    self.title = [businessCard fullName];
}

@end
