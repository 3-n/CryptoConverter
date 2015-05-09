//
//  CCCryptoListTableViewCell.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoListTableViewCell.h"


@interface CCCryptoListTableViewCell ()

@property (nonatomic, strong) NSArray *codeLabelHorizontalConstraints;

@end

@implementation CCCryptoListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor cc_backgroundColor];
        
        _codeLabel = [[UILabel alloc] initForAutoLayout];
        _codeLabel.font = [UIFont cc_codeCellFont];
        _codeLabel.textColor = [UIColor cc_primaryTextColor];
        [self.contentView addSubview:_codeLabel];
        
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-accessory"]];
        [_accessoryImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_accessoryImageView];
        
        [_codeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_accessoryImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_accessoryImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        
        _codeLabelHorizontalConstraints = [self codeLabelConstraintsForSelected:NO];
        [self.contentView addConstraints:_codeLabelHorizontalConstraints];
    }
    return self;
}

- (NSArray *)codeLabelConstraintsForSelected:(BOOL)selected {
    return [UIView autoCreateConstraintsWithoutInstalling:^{
        if (selected) {
            [self.codeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        }
        else {
            [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
            [self.codeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.accessoryImageView withOffset:10];
        }
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [self.contentView layoutIfNeeded];
    
    self.codeLabel.textColor = selected ? [UIColor cc_highlightedTextColor] : [UIColor cc_primaryTextColor];
    
    if (selected != self.selected) {
        [self.contentView removeConstraints:_codeLabelHorizontalConstraints];
        _codeLabelHorizontalConstraints = [self codeLabelConstraintsForSelected:selected];
        [self.contentView addConstraints:_codeLabelHorizontalConstraints];
    }
    
    [UIView animateWithDuration:0.25 delay:0 options:0 animations:^{
        [self.contentView layoutIfNeeded];
        self.accessoryImageView.alpha = !selected;
    } completion:^(BOOL finished) {
    }];
    
    [super setSelected:selected animated:animated];
}

@end
