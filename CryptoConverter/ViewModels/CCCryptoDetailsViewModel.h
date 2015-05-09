//
//  CCCryptoDetailsViewModel.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CCCrypto;
@class CCFiatRate;

@interface CCCryptoDetailsViewModel : NSObject

@property (nonatomic, strong) CCCrypto *crypto;
@property (nonatomic, strong) NSDecimalNumber *cryptoAmount;
@property (nonatomic, strong) NSArray *fiatRates;

- (NSString *)amountOfFiatString:(CCFiatRate *)fiat;

@end
