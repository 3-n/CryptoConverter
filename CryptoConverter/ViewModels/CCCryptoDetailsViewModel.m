//
//  CCCryptoDetailsViewModel.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoDetailsViewModel.h"

// Models
#import "CCFiatRate.h"


@implementation CCCryptoDetailsViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _fiatRates = [CCCryptoDetailsViewModel tempData];
    }
    return self;
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
                 fiatRate.rate = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.code = @"US Dollar";
                 fiatRate.name = @"USD";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rate = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.code = @"Zloty";
                 fiatRate.name = @"PLN";
                 fiatRate;
             }),             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rate = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.code = @"Euro";
                 fiatRate.name = @"eur";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rate = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.code = @"Pound";
                 fiatRate.name = @"GPB";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rate = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.code = @"Yen";
                 fiatRate.name = @"Yen";
                 fiatRate;
             }),
             ({
                 CCFiatRate *fiatRate = [CCFiatRate new];
                 fiatRate.rate = [NSDecimalNumber decimalNumberWithString:@"2.0"];
                 fiatRate.code = @"Ruble";
                 fiatRate.name = @"rub";
                 fiatRate;
             })
        ];
}

@end
