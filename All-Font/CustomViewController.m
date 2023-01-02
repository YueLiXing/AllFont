//
//  CustomViewController.m
//  All-Font
//
//  Created by yuelixing on 2023/1/2.
//  Copyright © 2023 YueLiXing. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义";
    self.view.backgroundColor = UIColor.whiteColor;
    
    UILabel *label = [[UILabel alloc] init];
    // 得意黑
    // https://github.com/atelier-anchor/smiley-sans/releases/tag/v1.0.0
    label.font = [UIFont fontWithName:@"SmileySans-Oblique" size:30];
    label.text = self.text;
    [self.view addSubview:label];
    label.mj_y = NavBarHeight;
    label.mj_x = 5;
    label.mj_size = [label sizeThatFits:CGSizeMake(AppWidth - 10, 40)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
