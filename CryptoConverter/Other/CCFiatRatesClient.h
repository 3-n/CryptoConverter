//
//  CCFiatRatesClient.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <Overcoat/OVCHTTPSessionManager.h>
#import <Overcoat/OVCResponse.h>


@interface CCFiatBtcRate : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *rate;

@end


@interface CCFiatRatesClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)getRatesWithCompletion:(void (^)(NSArray *fiatBtcRates, NSError *error))block;

@end
