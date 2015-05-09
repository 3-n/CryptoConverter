//
//  CCFiatRatesClient.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCFiatRatesClient.h"


@implementation CCFiatBtcRate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return  @{ @"rate" : @"last" };
}

@end


@implementation CCFiatRatesClient

- (void)getRatesWithCompletion:(void (^)(NSArray *fiatBtcRates, NSError *error))completionBlock {
    NSString *path = @"ticker";
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSMutableArray *rates = [NSMutableArray arrayWithCapacity:responseObject.count];
        for (NSString *key in responseObject) {
            [rates addObject:[[NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[[self class] modelClassesByResourcePath][path]] transformedValue:responseObject[key]]];
        }
        completionBlock([NSArray arrayWithArray:rates], nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

+ (NSDictionary *)modelClassesByResourcePath {
    return @{ @"ticker": [CCFiatBtcRate class] };
}

+ (instancetype)sharedClient {
    static dispatch_once_t onceToken;
    static CCFiatRatesClient * sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CCFiatRatesClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://blockchain.info/pl/"]];
    });
    
    return sharedInstance;
}

@end
