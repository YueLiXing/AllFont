//
//  TableViewCell.m
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic, retain) UILabel * titleLabel;

@property (nonatomic, retain) UILabel * subTitleLabel;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.fd_enforceFrameLayout = YES;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title SubTitle:(NSString *)subTitle Color:(UIColor *)color {
    self.titleLabel.textColor = color;
//    self.subTitleLabel.textColor = color;
    
    self.titleLabel.text = title;
    self.subTitleLabel.text = subTitle;
    self.titleLabel.font = [UIFont fontWithName:subTitle size:40];
    self.subTitleLabel.font = [UIFont systemFontOfSize:13];
    
    self.titleLabel.mj_y = 5;
    self.titleLabel.mj_size = [self.titleLabel sizeOfFullWithWidth:AppWidth];
    self.subTitleLabel.mj_y = self.titleLabel.max_y+5;
    self.subTitleLabel.mj_size = [self.subTitleLabel sizeOfFullWithWidth:AppWidth];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, self.subTitleLabel.max_y+3);
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.mj_x = 20;
        _titleLabel.mj_width = AppWidth-40;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.mj_x = 20;
        _subTitleLabel.mj_width = AppWidth-40;
    }
    return _subTitleLabel;
}

@end
