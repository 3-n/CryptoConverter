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
    NSDecimalNumber *biggestAllowed = [NSDecimalNumber decimalNumberWithString:@"999999999"];
    NSDecimalNumber *smallestAllowed = [NSDecimalNumber decimalNumberWithString:@"0.01"];
    
    if ([self compare:smallestAllowed] == NSOrderedAscending) {
        return [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"less than", nil), [smallestAllowed stringValue]];
    }
    
    if ([self compare:biggestAllowed] == NSOrderedDescending) {
        return NSLocalizedString(@"bazillion", nil);
    }
    
    return [[NSDecimalNumber fiatFormatter] stringFromNumber:self];
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
        [sharedFormatter setMinimumFractionDigits:0];
        [sharedFormatter setMaximumFractionDigits:99];
        [sharedFormatter setCurrencySymbol:@""];
        [sharedFormatter setPositiveSuffix:[sharedFormatter.positiveSuffix stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        [sharedFormatter setNegativeSuffix:[sharedFormatter.negativeSuffix stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        [sharedFormatter setLocale:[NSLocale currentLocale]];
        sharedFormatter.lenient = YES;
    });
    
    return sharedFormatter;
}

@end
