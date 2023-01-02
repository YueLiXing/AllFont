//
//  ViewController.m
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "CustomViewController.h"

static NSString * kDefaultString = @"kDefaultString";
static NSString * kDefaultString1 = @"kDefaultString1";
static NSString * kColorR = @"kColorR";
static NSString * kColorG = @"kColorG";
static NSString * kColorB = @"kColorB";

@interface ViewController () <UITextFieldDelegate>

@property (retain, nonatomic) UITextField * textField;
@property (retain, nonatomic) UITextField * textField1;

@property (retain, nonatomic) UITextField * rTextField;
@property (retain, nonatomic) UITextField * gTextField;
@property (retain, nonatomic) UITextField * bTextField;

@property (nonatomic, retain) UIButton * finishButton0;
@property (nonatomic, retain) UIButton * finishButton1;
@property (nonatomic, retain) UIButton * finishButton2;
@property (nonatomic, retain) UIButton * finishButton3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"请输入内容";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.textField1];
    [self.view addSubview:self.rTextField];
    [self.view addSubview:self.gTextField];
    [self.view addSubview:self.bTextField];
    [self.view addSubview:self.finishButton0];
    [self.view addSubview:self.finishButton1];
    [self.view addSubview:self.finishButton2];
    [self.view addSubview:self.finishButton3];
    
    self.textField.mj_y = NavBarHeight+5;
    self.rTextField.mj_centerX = self.gTextField.mj_centerX = self.bTextField.mj_centerX = self.textField.mj_centerX = self.textField1.mj_centerX = AppWidth/2.0;
    self.textField1.mj_y = self.textField.max_y+5;
    self.rTextField.mj_y = self.textField1.max_y+5;
    self.gTextField.mj_y = self.rTextField.max_y+5;
    self.bTextField.mj_y = self.gTextField.max_y+5;
    
    self.finishButton0.mj_size = CGSizeMake(100, 40);
    self.finishButton1.mj_size = CGSizeMake(100, 40);
    self.finishButton2.mj_size = CGSizeMake(120, 60);
    self.finishButton3.mj_size = CGSizeMake(200, 60);
    
    self.finishButton0.mj_centerX = self.finishButton1.mj_centerX = self.finishButton2.mj_centerX = self.finishButton3.mj_centerX = AppWidth/2.0;
    self.finishButton0.mj_y = self.bTextField.max_y+5;
    self.finishButton1.mj_y = self.finishButton0.max_y+5;
    self.finishButton2.mj_y = self.finishButton1.max_y+5;
    self.finishButton3.mj_y = self.finishButton2.max_y+5;
    [self.finishButton0 makeCorRadius];
    [self.finishButton1 makeCorRadius];
    [self.finishButton2 makeCorRadius];
}

- (void)finishButtonClick:(UIButton *)button {
    if (self.textField.text && self.textField.text.length > 0) {
        int r = self.rTextField.text.intValue;
        int g = self.gTextField.text.intValue;
        int b = self.bTextField.text.intValue;
        if (button.tag == 36) {
            CustomViewController *vc = [[CustomViewController alloc] init];
            vc.text = self.textField.text;
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
        if (0 <= r && r <= 255) {
            if (0 <= g && g <= 255) {
                if (0 <= b && b <= 255) {
                    [NSUserDefaults saveObject:self.textField.text Key:kDefaultString];
                    
                    if (self.textField1.text && self.textField1.text.length > 0) {
                        [NSUserDefaults saveObject:self.textField1.text Key:kDefaultString1];
                    } else {
                        [NSUserDefaults removeObject:kDefaultString1];
                    }
                    
                    [NSUserDefaults saveObject:self.rTextField.text Key:kColorR];
                    [NSUserDefaults saveObject:self.gTextField.text Key:kColorG];
                    [NSUserDefaults saveObject:self.bTextField.text Key:kColorB];
                    
                    
                    
                    NextViewController * nextVC = [[NextViewController alloc] init];
                    nextVC.fontSize = (CGFloat)button.tag;
                    nextVC.text = self.textField.text;
                    nextVC.text1 = self.textField1.text;
                    nextVC.color = RGB(r, g, b);
                    [self.navigationController pushViewController:nextVC animated:YES];
                    return;
                }
            }
        }
        [self showHint:@"请输入正确的色值范围"];
    } else {
        [self showHint:@"请输入文字"];
    }
}

#pragma mark - get

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.delegate = self;
        _textField.mj_size = CGSizeMake(AppWidth-40, 40);
        _textField.placeholder = @"请输入第一行的文字";
        NSString * string = [NSUserDefaults objectForKey:kDefaultString];
        if (string) {
            _textField.text = string;
        }
    }
    return _textField;
}
- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] init];
        _textField1.textAlignment = NSTextAlignmentCenter;
        _textField1.borderStyle = UITextBorderStyleRoundedRect;
        _textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField1.delegate = self;
        _textField1.mj_size = CGSizeMake(AppWidth-40, 40);
        _textField1.placeholder = @"请输入第二行的文字";
        NSString * string = [NSUserDefaults objectForKey:kDefaultString1];
        if (string) {
            _textField1.text = string;
        }
    }
    return _textField1;
}


- (UITextField *)rTextField {
    if (!_rTextField) {
        _rTextField = [[UITextField alloc] init];
        _rTextField.textColor = [UIColor redColor];
        _rTextField.textAlignment = NSTextAlignmentCenter;
        _rTextField.borderStyle = UITextBorderStyleRoundedRect;
        _rTextField.delegate = self;
        _rTextField.mj_size = CGSizeMake(AppWidth-40, 40);
        _rTextField.placeholder = @"R-RGB";
        NSString * string = [NSUserDefaults objectForKey:kColorR];
        if (string) {
            _rTextField.text = string;
        }
    }
    return _rTextField;
}


- (UITextField *)gTextField {
    if (!_gTextField) {
        _gTextField = [[UITextField alloc] init];
        _gTextField.textColor = [UIColor greenColor];
        _gTextField.textAlignment = NSTextAlignmentCenter;
        _gTextField.borderStyle = UITextBorderStyleRoundedRect;
        _gTextField.delegate = self;
        _gTextField.mj_size = CGSizeMake(AppWidth-40, 40);
        _gTextField.placeholder = @"G-RGB";
        NSString * string = [NSUserDefaults objectForKey:kColorG];
        if (string) {
            _gTextField.text = string;
        }
    }
    return _gTextField;
}


- (UITextField *)bTextField {
    if (!_bTextField) {
        _bTextField = [[UITextField alloc] init];
        _bTextField.textColor = [UIColor blueColor];
        _bTextField.textAlignment = NSTextAlignmentCenter;
        _bTextField.borderStyle = UITextBorderStyleRoundedRect;
        _bTextField.delegate = self;
        _bTextField.mj_size = CGSizeMake(AppWidth-40, 40);
        _bTextField.placeholder = @"B-RGB";
        NSString * string = [NSUserDefaults objectForKey:kColorB];
        if (string) {
            _bTextField.text = string;
        }
    }
    return _bTextField;
}

- (UIButton *)finishButton0 {
    if (!_finishButton0) {
        _finishButton0 = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishButton0.titleLabel.font = [UIFont systemFontOfSize:15];
        _finishButton0.tag = 15;
        [_finishButton0 setTitle:@"确定" forState:UIControlStateNormal];
        [_finishButton0 addTarget:self action:@selector(finishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_finishButton0 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x52CBAB)] forState:UIControlStateNormal];
        [_finishButton0 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x91dec9)] forState:UIControlStateHighlighted];
    }
    return _finishButton0;
}
- (UIButton *)finishButton1 {
    if (!_finishButton1) {
        _finishButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishButton1.titleLabel.font = [UIFont systemFontOfSize:25];
        _finishButton1.tag = 25;
        [_finishButton1 setTitle:@"确定" forState:UIControlStateNormal];
        [_finishButton1 addTarget:self action:@selector(finishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_finishButton1 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x52CBAB)] forState:UIControlStateNormal];
        [_finishButton1 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x91dec9)] forState:UIControlStateHighlighted];
    }
    return _finishButton1;
}

- (UIButton *)finishButton2 {
    if (!_finishButton2) {
        _finishButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishButton2.titleLabel.font = [UIFont systemFontOfSize:35];
        _finishButton2.tag = 35;
        [_finishButton2 setTitle:@"确定" forState:UIControlStateNormal];
        [_finishButton2 addTarget:self action:@selector(finishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_finishButton2 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x52CBAB)] forState:UIControlStateNormal];
        [_finishButton2 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x91dec9)] forState:UIControlStateHighlighted];
    }
    return _finishButton2;
}
- (UIButton *)finishButton3 {
    if (!_finishButton3) {
        _finishButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishButton3.titleLabel.font = [UIFont systemFontOfSize:35];
        _finishButton3.tag = 36;
        [_finishButton3 setTitle:@"自定义字体" forState:UIControlStateNormal];
        [_finishButton3 addTarget:self action:@selector(finishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_finishButton3 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x52CBAB)] forState:UIControlStateNormal];
        [_finishButton3 setBackgroundImage:[UIImage imageWithColor:RGBColor(0x91dec9)] forState:UIControlStateHighlighted];
    }
    return _finishButton3;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
//    [self finishButtonClick];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}



@end
