//
//  CCFiatRate.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CCCrypto;

@interface CCFiatRateViewModel : NSObject

@property (nonatomic, strong) CCCrypto *crypto;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSDecimalNumber *rateToBtc;

@end
