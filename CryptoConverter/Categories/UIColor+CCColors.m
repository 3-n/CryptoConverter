//
//  UIColor+CCColors.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "UIColor+CCColors.h"


@implementation UIColor (CCColors)

+ (UIColor *)cc_primaryTextColor {
    return [UIColor cc_tealColor];
}

+ (UIColor *)cc_secondaryTextColor {
    return [UIColor cc_tealColor];
}

+ (UIColor *)cc_highlightedTextColor {
    return [UIColor cc_darkTealColor];
}

+ (UIColor *)cc_backgroundColor {
    return [UIColor cc_lighterGrayBackgroundColor];
}

+ (UIColor *)cc_backgroundColorAlternate {
    return [UIColor cc_lightGrayBackgroundColor];
}

+ (UIColor *)cc_backgroundColorHighlight {
    return [UIColor cc_lightTealColor];
}

+ (UIColor *)cc_lightTealColor {
    return [UIColor colorWithRed:0xef/255.f green:0xfd/255.f blue:0xfd/255.f alpha:1.f];
}

+ (UIColor *)cc_tealColor {
    return [UIColor colorWithRed:0.f green:0x99/255.f blue:0x99/255.f alpha:1.f];
}

+ (UIColor *)cc_darkTealColor {
    return [UIColor colorWithRed:0.f green:0x72/255.f blue:0x72/255.f alpha:1.f];
}

+ (UIColor *)cc_darkGrayColor {
    return [UIColor colorWithWhite:0x34/255.f alpha:1.f];
}

+ (UIColor *)cc_grayColor {
    return [UIColor colorWithWhite:0x5c/255.f alpha:1.f];
}

+ (UIColor *)cc_lightGrayColor {
    return [UIColor colorWithWhite:0x99/255.f alpha:1.f];
}

+ (UIColor *)cc_lightGrayBackgroundColor {
    return [UIColor colorWithWhite:0xf2/255.f alpha:1.f];
}

+ (UIColor *)cc_lighterGrayBackgroundColor {
    return [UIColor colorWithWhite:0xf5/255.f alpha:1.f];
}


@end
