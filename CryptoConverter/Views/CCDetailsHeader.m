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
        self.backgroundColor = [UIColor cc_backgroundColorAlternate];
        
        _contentView = [[UIView alloc] init];
        [self addSubview:_contentView];
        
        _cryptoCodeLabel = [[UILabel alloc] init];
        _cryptoCodeLabel.text = @"BTC";
        _cryptoCodeLabel.textAlignment = NSTextAlignmentCenter;
        _cryptoCodeLabel.font = [UIFont cc_codeTitleFont];
        _cryptoCodeLabel.textColor = [UIColor cc_highlightedTextColor];
        [_contentView addSubview:_cryptoCodeLabel];
        
        
        _amountInput = [[UITextField alloc] init];
        _amountInput.textAlignment = NSTextAlignmentRight;
        _amountInput.keyboardType = UIKeyboardTypeDecimalPad;
        _amountInput.keyboardAppearance = UIKeyboardAppearanceLight;
        _amountInput.placeholder = NSLocalizedString(@"enter amount", nil);
        _amountInput.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"enter amount", nil) attributes:@{ NSFontAttributeName : [UIFont cc_amountFont] }];
        _amountInput.font = [UIFont cc_amountFont];
        _amountInput.textColor = [UIColor cc_primaryTextColor];
        [_contentView addSubview:_amountInput];
        
        [_contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [_amountInput autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 20, 30, 20) excludingEdge:ALEdgeTop];
        [_amountInput autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_cryptoCodeLabel withOffset:5];
        [_cryptoCodeLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(11, 20, 0, 20) excludingEdge:ALEdgeBottom];
        [_cryptoCodeLabel autoSetDimension:ALDimensionHeight toSize:80];
        
    }
    return self;
}

@end
