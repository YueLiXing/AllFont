//
//  UIView+Extension.h
//  MJRefreshExample
//
//  Created by MJ Lee on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MJExtension)

@property (assign, nonatomic) CGFloat mj_x;
@property (assign, nonatomic) CGFloat mj_y;
@property (assign, nonatomic) CGFloat mj_width;
@property (assign, nonatomic) CGFloat mj_height;
@property (assign, nonatomic) CGSize mj_size;
@property (assign, nonatomic) CGPoint mj_origin;
@property (assign,nonatomic)CGFloat max_x;
@property (assign,nonatomic)CGFloat max_y;
@property (nonatomic, assign) CGFloat mj_centerX;
@property (nonatomic, assign) CGFloat mj_centerY;

@end


@interface UIView (CornerRadius)

- (void)makeCorRadius;

- (void)makeCorRadiusWithRadius:(CGFloat)radius;

- (void)addBorderWidth:(CGFloat)width Color:(UIColor *)color;

@end
