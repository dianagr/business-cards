//
//  BusinessCardViewController.m
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardViewController.h"

#import "BusinessCardsDataSource.h"
#import "BusinessCardView.h"

@interface BusinessCardViewController ()
@property (strong, nonatomic) BusinessCardsDataSource *dataSource;
@end
@implementation BusinessCardViewController

- (id)init {
    if (self = [super init]) {
        self.title = @"Business Cards";
        
        self.tableView.dataSource = self;
        _dataSource = [[BusinessCardsDataSource alloc] init];
    }
    return self;
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    }
    return cell;
}


@end
