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

// Models
#import "CCCrypto.h"


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
    return viewModel;
}

- (NSArray *)cryptosArrayForSection:(CCCryptoListSections)section {
    return self.cryptosBySection[section];
}

#pragma mark - Temporary

+ (NSArray *)tempData {
    return @[
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"btc";
            crypto.name = @"Bitcoin";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"ltc";
            crypto.name = @"Litecoin";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"doge";
            crypto.name = @"Dogecoin";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"nmc";
            crypto.name = @"Namecoin";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"msc";
            crypto.name = @"Mastercoin";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"ppc";
            crypto.name = @"Peercoin";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"xrp";
            crypto.name = @"Ripple";
            crypto;
        }),
        ({
            CCCrypto *crypto = [CCCrypto new];
            crypto.code = @"aur";
            crypto.name = @"Auroracoin";
            crypto;
        })
    ];
}

@end
