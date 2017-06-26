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

@property (nonatomic, retain) UILabel * titleLabel1;

@property (nonatomic, retain) UILabel * subTitleLabel;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.fd_enforceFrameLayout = YES;
        
        self.isSingleLine = YES;
        self.fontSize = 20;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.titleLabel1];
    }
    return self;
}

- (void)setTitle:(NSString *)title SubTitle:(NSString *)subTitle FontName:(NSString *)fontName Color:(UIColor *)color {
    self.titleLabel.textColor = color;
//    self.subTitleLabel.textColor = color;
    
    self.titleLabel.text = title;
    self.titleLabel1.text = subTitle;
    self.subTitleLabel.text = fontName;
    self.titleLabel.font = [UIFont fontWithName:fontName size:self.fontSize];
    self.titleLabel1.font = [UIFont fontWithName:fontName size:self.fontSize];
    self.subTitleLabel.font = [UIFont systemFontOfSize:13];
    
    self.titleLabel.mj_y = 5;
    self.titleLabel.mj_size = [self.titleLabel sizeOfFullWithWidth:AppWidth];
    self.subTitleLabel.mj_size = [self.subTitleLabel sizeOfFullWithWidth:AppWidth];
    
    if (self.isSingleLine) {
        self.titleLabel1.hidden = YES;
        self.subTitleLabel.mj_y = self.titleLabel.max_y+5;
    } else {
        self.titleLabel1.mj_y = self.titleLabel.max_y+5;
        self.titleLabel1.mj_size = [self.titleLabel1 sizeOfFullWithWidth:AppWidth];
        self.subTitleLabel.mj_y = self.titleLabel1.max_y+5;
    }
    
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

- (UILabel *)titleLabel1 {
    if (!_titleLabel1) {
        _titleLabel1 = [[UILabel alloc] init];
        _titleLabel1.mj_x = 20;
        _titleLabel1.mj_width = AppWidth-40;
    }
    return _titleLabel1;
}
@end
