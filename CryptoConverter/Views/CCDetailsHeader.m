//
//  CCDetailsHeader.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCDetailsHeader.h"

#import <PureLayout/PureLayout.h>


@implementation CCDetailsHeader

- (instancetype)init {
    self = [super init];
    if (self) {
        _contentView = [[UIView alloc] init];
        [self addSubview:_contentView];
        
        _cryptoCodeLabel = [[UILabel alloc] init];
        _cryptoCodeLabel.text = @"btc";
        [_contentView addSubview:_cryptoCodeLabel];
        
        
        _amountInput = [[UITextField alloc] init];
        _amountInput.placeholder = NSLocalizedString(@"enter amount", nil);
        [_contentView addSubview:_amountInput];
        
        [_contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [_amountInput autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [_amountInput autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_cryptoCodeLabel withOffset:5];
        [_cryptoCodeLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        
    }
    return self;
}

@end
