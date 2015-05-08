//
//  CCCryptoDetailCell.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoDetailCell.h"


@implementation CCCryptoDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _fiatLabel = [[UILabel alloc] initForAutoLayout];
        [self.contentView addSubview:_fiatLabel];
        
        _rateLabel = [[UILabel alloc] initForAutoLayout];
        [self.contentView addSubview:_rateLabel];

        [_fiatLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_rateLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [_fiatLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_fiatLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_rateLabel withOffset:10];
        [_rateLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    }
    return self;
}

@end
