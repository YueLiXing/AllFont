//
//  ViewController.m
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import "ViewController.h"

static NSString * kDefaultString = @"kDefaultString";

@interface ViewController ()

@property (retain, nonatomic) UITextField * textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"请输入内容";
    
}

#pragma mark - get

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
    }
    return _textField;
}

@end
