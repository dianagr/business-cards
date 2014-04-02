//
//  BusinessCardView.m
//  business-cards
//
//  Created by Diana Gren on 3/27/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "BusinessCardView.h"

#import "BusinessCard.h"

@interface BusinessCardView ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *nameLabel;
@end

@implementation BusinessCardView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];

        _nameLabel = [[UILabel alloc] init];
        [_contentView addSubview:_nameLabel];
        
        [self _installConstraints];
    }
    return self;
}

- (void)_installConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_contentView, _nameLabel);
    for (UIView *view in [views allValues]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_contentView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_contentView]-100-|" options:0 metrics:nil views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_nameLabel]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_nameLabel]-|" options:0 metrics:nil views:views]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (void)setBusinessCard:(BusinessCard *)businessCard {
    _businessCard = businessCard;
    self.nameLabel.text = [businessCard fullName];
}

@end
