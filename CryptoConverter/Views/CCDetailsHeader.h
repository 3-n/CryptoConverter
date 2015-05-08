//
//  CCDetailsHeader.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CCDetailsHeader : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *cryptoCodeLabel;
@property (nonatomic, strong) UITextField *amountInput;

@end
