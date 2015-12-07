//
//  UIViewController+HUD.h
//  Tutu
//
//  Created by yuelixing on 15/11/13.
//  Copyright © 2015年 zxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIViewController (HUD)

- (MBProgressHUD *)HUD;

- (void)setHUD:(MBProgressHUD *)HUD;

- (MBProgressHUD *)showProgressHUD:(CGFloat)progress;

- (void)showHint:(NSString *)hint;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHUD;

@end
