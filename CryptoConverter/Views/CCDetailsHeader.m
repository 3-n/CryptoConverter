//
//  CCDetailsHeader.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCDetailsHeader.h"

// Categories
#import "NSDecimalNumber+CCNumberUtilities.h"
#import "UIToolbar+CCToolbars.h"


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
        _amountInput.delegate = self;
        _amountInput.textAlignment = NSTextAlignmentRight;
        _amountInput.keyboardType = UIKeyboardTypeDecimalPad;
        _amountInput.keyboardAppearance = UIKeyboardAppearanceLight;
        __weak __typeof__(self) weakSelf = self;
        _amountInput.inputAccessoryView = [UIToolbar accessoryToolbarWithOkBlock:^(id sender) {
            __strong __typeof__(self) strongSelf = weakSelf;
            [strongSelf->_amountInput resignFirstResponder];
        }];
        _amountInput.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"enter amount here", nil) attributes:@{ NSFontAttributeName : [UIFont cc_amountFont] }];
        _amountInput.font = [UIFont cc_amountFont];
        _amountInput.textColor = [UIColor cc_primaryTextColor];
        [_contentView addSubview:_amountInput];
        
        [_contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [_amountInput autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 5, 20, 20) excludingEdge:ALEdgeTop];
        [_cryptoCodeLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(11, 20, 0, 20) excludingEdge:ALEdgeBottom];
        [_cryptoCodeLabel autoSetDimension:ALDimensionHeight toSize:80];
    }
    return self;
}

#pragma mark - UITextFIeldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    
    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    NSString *decimalSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator];
    
    if (![newText length]) {
        if ([self.delegate respondsToSelector:@selector(detailsHeader:didChangeAmount:rawText:)]) {
            [self.delegate detailsHeader:self didChangeAmount:[NSDecimalNumber zero] rawText:@""];
        }
        return YES;
    }
    
    // no returning YES past this point, only modified newText is passed to textfield.text
    
    NSArray *stringComponents = [newText componentsSeparatedByString:decimalSeparator];
    if ([stringComponents count] > 2) {
        return NO;
    }
    
    
    NSInteger maxTextLength = 18;
    if (newText.length > maxTextLength) {
        newText = [newText substringToIndex:maxTextLength];
        if ([newText hasSuffix:decimalSeparator]) {
            [newText substringToIndex:newText.length-2];
        }
    }
    
    if (newText.length == maxTextLength && [newText hasSuffix:decimalSeparator]) {
        newText = [newText stringByReplacingOccurrencesOfString:decimalSeparator withString:@""];
    }
    
    NSDecimalNumber *candidateForNumber = [NSDecimalNumber decimalNumberWithString:[newText stringByReplacingOccurrencesOfString:groupingSeparator withString:@""] locale:[NSLocale currentLocale]];
    
    if ([candidateForNumber isEqualToNumber:[NSDecimalNumber notANumber]]) {
        return NO;
    }
    
    if (![newText containsString:decimalSeparator]) {
        textField.text = [candidateForNumber cc_stringCryptoValue];
        if ([self.delegate respondsToSelector:@selector(detailsHeader:didChangeAmount:rawText:)]) {
            [self.delegate detailsHeader:self didChangeAmount:candidateForNumber rawText:textField.text];
        }
    }
    else {
        if ([newText hasPrefix:decimalSeparator]) {
            textField.text = [NSString stringWithFormat:@"0%@", newText];
        }
        else {
            textField.text = newText;
        }
        if ([self.delegate respondsToSelector:@selector(detailsHeader:didChangeAmount:rawText:)]) {
            [self.delegate detailsHeader:self didChangeAmount:candidateForNumber rawText:textField.text];
        }
    }
    return NO;
}

@end
