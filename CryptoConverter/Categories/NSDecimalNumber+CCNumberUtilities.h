//
//  NSDecimalNumber+CCNumberUtilities.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDecimalNumber (CCNumberUtilities)

- (NSString *)cc_stringCryptoValue;
- (NSString *)cc_stringFiatValue;

@end
