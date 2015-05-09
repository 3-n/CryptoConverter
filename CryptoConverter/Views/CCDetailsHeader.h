//
//  CCDetailsHeader.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <UIKit/UIKit.h>


// Protocols
#import "CCDetailsHeaderDelegate.h"


@interface CCDetailsHeader : UIView <UITextFieldDelegate>

@property (nonatomic, weak) id<CCDetailsHeaderDelegate> delegate;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *cryptoCodeLabel;
@property (nonatomic, strong) UITextField *amountInput;

@end
