//
//  BusinessCardViewController.m
//  business-cards
//
//  Created by Diana Gren on 3/28/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardViewController.h"

#import "BusinessCardView.h"

@interface BusinessCardViewController ()
@property (strong, nonatomic) BusinessCardView *businessCardView;
@end

@implementation BusinessCardViewController

- (void)loadView {
    [super loadView];
    self.view = self.businessCardView;
}

- (BusinessCardView *)businessCardView {
    if (!_businessCardView) {
        _businessCardView = [[BusinessCardView alloc] initWithFrame:self.view.frame];
    }
    return _businessCardView;
}

@end
