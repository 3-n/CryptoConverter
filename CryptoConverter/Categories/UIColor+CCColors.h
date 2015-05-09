//
//  UIColor+CCColors.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (CCColors)

+ (UIColor *)cc_primaryTextColor;
+ (UIColor *)cc_secondaryTextColor;
+ (UIColor *)cc_highlightedTextColor;

+ (UIColor *)cc_backgroundColor;
+ (UIColor *)cc_backgroundColorAlternate;
+ (UIColor *)cc_backgroundColorHighlight;

+ (UIColor *)cc_lightTealColor;
+ (UIColor *)cc_tealColor;
+ (UIColor *)cc_darkTealColor;
+ (UIColor *)cc_darkGrayColor;
+ (UIColor *)cc_grayColor;
+ (UIColor *)cc_lightGrayColor;
+ (UIColor *)cc_lightGrayBackgroundColor;
+ (UIColor *)cc_lighterGrayBackgroundColor;

@end
