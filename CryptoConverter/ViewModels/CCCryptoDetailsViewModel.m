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
#import "CCFiatRateViewModel.h"

// Categories
#import "NSDecimalNumber+CCNumberUtilities.h"


@implementation CCCryptoDetailsViewModel

- (NSString *)amountOfFiatString:(CCFiatRateViewModel *)fiat {
    NSDecimalNumber *cryptoFiatRate = [self.crypto.rateToBtc decimalNumberByMultiplyingBy:fiat.rateToBtc];
    NSDecimalNumber *amountInFiat = [self.cryptoAmount decimalNumberByMultiplyingBy:cryptoFiatRate];
    
    if ([self.cryptoAmount compare:[NSDecimalNumber zero]] == NSOrderedSame) {
        return [cryptoFiatRate cc_stringFiatValue];
    }
    
    return [amountInFiat cc_stringFiatValue];
}

@end
