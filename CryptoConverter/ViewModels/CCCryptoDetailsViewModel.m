//
//  CCCryptoDetailsViewModel.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoDetailsViewModel.h"

// Models
#import "CCCrypto.h"
#import "CCFiatRate.h"

// Categories
#import "NSDecimalNumber+CCNumberUtilities.h"


@implementation CCCryptoDetailsViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _fiatRates = [CCCryptoDetailsViewModel tempData];
    }
    return self;
}

- (NSString *)amountOfFiatString:(CCFiatRate *)fiat {
    NSDecimalNumber *cryptoFiatRate = [self.crypto.rateToBtc decimalNumberByMultiplyingBy:fiat.rateToBtc];
    NSDecimalNumber *amountInFiat = [self.cryptoAmount decimalNumberByMultiplyingBy:cryptoFiatRate];
    
    if ([self.cryptoAmount compare:[NSDecimalNumber zero]] == NSOrderedSame) {
        return [cryptoFiatRate cc_stringFiatValue];
    }
    
    return [amountInFiat cc_stringFiatValue];
}

#pragma mark - Temporary

- (void)setCrypto:(CCCrypto *)crypto {
    _crypto = crypto;
    
    for (CCFiatRate *fiatRate in self.fiatRates) {
        fiatRate.crypto = crypto;
    }
}

+ (NSArray *)tempData {
    return @[
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"240"];
                 fiatRate.name = @"US Dollar";
                 fiatRate.code = @"USD";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"863"];
                 fiatRate.name = @"Zloty";
                 fiatRate.code = @"PLN";
                 fiatRate;
             }),             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"213"];
                 fiatRate.name = @"Euro";
                 fiatRate.code = @"eur";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.name = @"Pound";
                 fiatRate.code = @"GPB";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.name = @"Yen";
                 fiatRate.code = @"Yen";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.name = @"Ruble";
                 fiatRate.code = @"rub";
                 fiatRate;
             })
        ];
}

@end
