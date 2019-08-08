//
//  HeaderView.m
//  All-Font
//
//  Created by yuelixing on 2018/7/23.
//  Copyright © 2018年 YueLiXing. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

@property (nonatomic, retain) UILabel * titleLabel;

@end


@implementation HeaderView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 1)];
        lineView.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:lineView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.preferredMaxLayoutWidth = AppWidth-24;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.titleLabel];
        
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesClick)]];
    }
    return self;
}

- (void)setModel:(SectionModel *)model {
    _model = model;
    NSString * tempFontName = [UIFont fontNamesForFamilyName:model.title].firstObject;
//    NSLog(@"tempFontName %@", tempFontName);
    self.titleLabel.font = [UIFont fontWithName:tempFontName size:self.fontSize*0.5];
//    self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize*0.5];
    self.titleLabel.text = model.title;
    [self.titleLabel sizeToFit];
    
    self.titleLabel.mj_x = 12;
    self.titleLabel.mj_centerY = 20;
}

- (void)tapGesClick {
    if (self.delegate) {
        [self.delegate headerViewDidSelect:self];
    }
}


@end
