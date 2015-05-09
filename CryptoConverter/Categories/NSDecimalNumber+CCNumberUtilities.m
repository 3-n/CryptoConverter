//
//  NSDecimalNumber+CCNumberUtilities.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "NSDecimalNumber+CCNumberUtilities.h"


@implementation NSDecimalNumber (CCNumberUtilities)

- (NSString *)cc_stringCryptoValue {
    return [[NSDecimalNumber cryptoFormatter] stringFromNumber:self];
}

- (NSString *)cc_stringFiatValue {
    return [[NSDecimalNumber cryptoFormatter] stringFromNumber:self];
}

+ (NSNumberFormatter *)fiatFormatter {
    static dispatch_once_t onceToken;
    static NSNumberFormatter * sharedFormatter = nil;
    dispatch_once(&onceToken, ^{
        sharedFormatter = [[NSNumberFormatter alloc] init];
        [sharedFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [sharedFormatter setMaximumFractionDigits:2];
        [sharedFormatter setCurrencySymbol:@""];
    });
    
    return sharedFormatter;
}

+ (NSNumberFormatter *)cryptoFormatter {
    static dispatch_once_t onceToken;
    static NSNumberFormatter * sharedFormatter = nil;
    dispatch_once(&onceToken, ^{
        sharedFormatter = [[NSNumberFormatter alloc] init];
        [sharedFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [sharedFormatter setCurrencySymbol:@""];
    });
    
    return sharedFormatter;
}

@end
