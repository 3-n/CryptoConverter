//
//  UIToolbar+CCToolbars.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIToolbar (CCToolbars)

+ (UIToolbar *)accessoryToolbarWithOkBlock:(void (^)(id sender))okBlock;

@end
