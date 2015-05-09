//
//  UIFont+CCFonts.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "UIFont+CCFonts.h"


@implementation UIFont (CCFonts)

+ (UIFont *)cc_codeCellFont {
    return [UIFont fontWithName:@"HelveticaNeue" size:30];
}

+ (UIFont *)cc_codeTitleFont {
    return [UIFont fontWithName:@"HelveticaNeue" size:40];
}

+ (UIFont *)cc_nameCellFont {
    return [UIFont fontWithName:@"HelveticaNeue" size:20];
}

+ (UIFont *)cc_amountFont {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:30];
}

+ (UIFont *)cc_navbarTitleFont {
    return [UIFont fontWithName:@"HelveticaNeue" size:18];
}

@end
