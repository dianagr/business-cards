//
//  TabBarViewController.m
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "TabBarViewController.h"

#import "BusinessCardViewController.h"

@implementation TabBarViewController

- (id)init {
    if (self = [super init]) {
        BusinessCardViewController *businessViewController = [[BusinessCardViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:businessViewController];

        [self setViewControllers:@[navigationController]];
        [self.tabBar.items.firstObject setTitle:@"title"];
    }
    return self;
}

@end
