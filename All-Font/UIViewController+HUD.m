//
//  UIViewController+HUD.m
//  Tutu
//
//  Created by yuelixing on 15/11/13.
//  Copyright © 2015年 zxy. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <objc/runtime.h>


static const void *ProgressHUDKey = &ProgressHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, ProgressHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, ProgressHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint {
    [self hideHUD];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}


- (MBProgressHUD *)showProgressHUD:(CGFloat)progress {
    MBProgressHUD * hud = [self HUD];
    if (hud == nil) {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    hud.progress = progress;
    [self setHUD:hud];
    return hud;
}

- (void)hideHUD {
    [[self HUD] hide:YES];
}
- (void)showHint:(NSString *)hint {
    [self hideHUD];
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    //    hud.yOffset = -[UIScreen mainScreen].bounds.size.height/5;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:[hint dataUsingEncoding:NSUTF8StringEncoding].length*0.1>5.0?5.0:[hint dataUsingEncoding:NSUTF8StringEncoding].length*0.1];
}

@end
