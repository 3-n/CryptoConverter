//
//  CCCryptoListTableViewCell.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoListTableViewCell.h"

@implementation CCCryptoListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _codeLabel = [[UILabel alloc] initForAutoLayout];
        
        [self.contentView addSubview:_codeLabel];
        
        [_codeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [_codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_codeLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    }
    return self;
}

@end
