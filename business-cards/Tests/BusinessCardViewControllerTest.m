//
//  MyTest.m
//
#import <GHUnit/GHUnit.h>

#import "BusinessCardViewController.h"

@interface BusinessCardViewControllerTest : GHViewTestCase
@end

@implementation BusinessCardViewControllerTest

- (CGSize)sizeForView:(UIView *)view {
    return CGSizeMake(320, 568);
}

- (void)testView {
    BusinessCardViewController *businessCardViewController = [[BusinessCardViewController alloc] init];
    [businessCardViewController.view layoutIfNeeded];
    GHVerifyView(businessCardViewController.view);
}

@end
