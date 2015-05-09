//
//  UIToolbar+CCToolbars.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "UIToolbar+CCToolbars.h"
#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@implementation UIToolbar (CCToolbars)

+ (UIToolbar *)accessoryToolbarWithOkBlock:(void (^)(id sender))okBlock {
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleDefault;
    [toolbar sizeToFit];
    
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace handler:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] bk_initWithTitle:NSLocalizedString(@"Done", nil) style:UIBarButtonItemStylePlain handler:okBlock];
    
    [toolbar setItems:@[ flexibleSpaceLeft, doneButton ]];
    return toolbar;
}

@end
