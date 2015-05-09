//
//  CCCryptoListViewModel.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoListViewModel.h"

// ViewModels
#import "CCCryptoDetailsViewModel.h"
#import "CCFiatRateViewModel.h"

// Models
#import "CCCrypto.h"

// APIs
#import "CCFiatRatesClient.h"


@interface CCCryptoListViewModel ()

@property (nonatomic, strong) NSArray *cryptosBySection;

@end

@implementation CCCryptoListViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _cryptosPopular = [[CCCryptoListViewModel tempData] subarrayWithRange:NSMakeRange(0, 3)];
        _cryptosAll = [CCCryptoListViewModel tempData];
        
        _cryptosBySection = @[ _cryptosPopular, _cryptosAll ];
    }
    return self;
}

- (CCCryptoDetailsViewModel *)viewModelForIndex:(NSInteger)index inSection:(CCCryptoListSections)section {
    CCCrypto *crypto = [self cryptosArrayForSection:section][index];
    
    CCCryptoDetailsViewModel *viewModel = [CCCryptoDetailsViewModel new];
    viewModel.crypto = crypto;
    
    if (self.fiatToBtcRates) {
        NSMutableArray *fiatBtcRates = [NSMutableArray arrayWithCapacity:self.fiatToBtcRates.count];
        for (CCFiatBtcRate *fiatBtcRate in self.fiatToBtcRates) {
            CCFiatRateViewModel *viewModel = [CCFiatRateViewModel new];
            viewModel.code = fiatBtcRate.code;
            viewModel.rateToBtc = [NSDecimalNumber decimalNumberWithString:fiatBtcRate.rate];
            [fiatBtcRates addObject:viewModel];
        }
        viewModel.fiatRates = fiatBtcRates;
    }
    
    return viewModel;
}

- (NSArray *)cryptosArrayForSection:(CCCryptoListSections)section {
    return self.cryptosBySection[section];
}

- (void)getFiatRatesWithCompletion:(void (^)(NSArray *fiatBtcRates, NSError *error))block {
    
    if ([self needsRateRefresh]) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [[CCFiatRatesClient sharedClient] getRatesWithCompletion:^(NSArray *fiatBtcRates, NSError *error) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            self.fiatToBtcRates = fiatBtcRates;
            block(fiatBtcRates, error);
        }];
    }
    else {
        block(self.fiatToBtcRates, nil);
    }
}

- (BOOL)needsRateRefresh {
    return YES;
}

#pragma mark - Temporary

+ (NSArray *)tempData {
    return @[
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"btc";
            crypto.name = @"Bitcoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"1"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"ltc";
            crypto.name = @"Litecoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"0.006"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"doge";
            crypto.name = @"Dogecoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"0.00000037"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"nmc";
            crypto.name = @"Namecoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"1"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"msc";
            crypto.name = @"Mastercoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"1"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"ppc";
            crypto.name = @"Peercoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"1"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"xrp";
            crypto.name = @"Ripple";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"1"];
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"aur";
            crypto.name = @"Auroracoin";
            crypto.rateToBtc = [NSDecimalNumber decimalNumberWithString:@"1"];
            crypto;
        })
    ];
}

@end
