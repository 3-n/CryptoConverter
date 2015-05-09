//
//  CCDetailsHeaderDelegate.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CCDetailsHeader;

@protocol CCDetailsHeaderDelegate <NSObject>

@required
- (void)detailsHeader:(CCDetailsHeader *)header didChangeAmount:(NSDecimalNumber *)amount rawText:(NSString *)text;

@end
