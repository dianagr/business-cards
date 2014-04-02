//
//  BusinessCardViewController.m
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardListViewController.h"

#import "BusinessCardsDataSource.h"
#import "BusinessCardView.h"

@interface BusinessCardListViewController ()
@property (strong, nonatomic) BusinessCardsDataSource *dataSource;
@end

@implementation BusinessCardListViewController

- (id)init {
    BusinessCardsDataSource *dataSource = [[BusinessCardsDataSource alloc] init];
    [dataSource loadSavedData];
    return [self initWithDataSource:dataSource];
}

- (instancetype)initWithDataSource:(BusinessCardsDataSource *)dataSource {
    if (self = [super init]) {
        self.title = @"Business Cards";
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(addNewCard:)];
        self.tableView.dataSource = self;
        _dataSource = dataSource;
    }
    return self;
}

- (void)addNewCard:(UIBarButtonItem *)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"default_card" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSDictionary *defaultCard = [NSDictionary dictionaryWithContentsOfURL:url];
    
    NSLog(@"%@", defaultCard);
    BusinessCard *businessCard = [BusinessCard businessCardFromJSONDictionary:defaultCard];
    [self.dataSource addBusinessCard:businessCard];
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        BusinessCard *businessCard = [self.dataSource businessCardForIndex:indexPath.row];

        cell.textLabel.text = businessCard.firstName;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataSource removeBusinessCardAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
