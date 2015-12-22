//
//  ViewController.m
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

static NSString * kDefaultString = @"kDefaultString";
static NSString * kColorR = @"kColorR";
static NSString * kColorG = @"kColorG";
static NSString * kColorB = @"kColorB";

@interface ViewController () <UITextFieldDelegate>

@property (retain, nonatomic) UITextField * textField;

@property (retain, nonatomic) UITextField * rTextField;
@property (retain, nonatomic) UITextField * gTextField;
@property (retain, nonatomic) UITextField * bTextField;

@property (nonatomic, retain) UIButton * finishButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"请输入内容";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.rTextField];
    [self.view addSubview:self.gTextField];
    [self.view addSubview:self.bTextField];
    [self.view addSubview:self.finishButton];
    
    self.textField.mj_y = 64+5;
    self.rTextField.mj_centerX = self.gTextField.mj_centerX = self.bTextField.mj_centerX = self.textField.mj_centerX = AppWidth/2.0;
    self.rTextField.mj_y = self.textField.max_y+5;
    self.gTextField.mj_y = self.rTextField.max_y+5;
    self.bTextField.mj_y = self.gTextField.max_y+5;
    
    self.finishButton.mj_size = CGSizeMake(100, 40);
    self.finishButton.mj_centerX = AppWidth/2.0;
    self.finishButton.mj_y = self.bTextField.max_y+5;
    [self.finishButton makeCorRadius];
}

- (void)finishButtonClick {
    if (self.textField.text && self.textField.text.length > 0) {
        int r = self.rTextField.text.intValue;
        int g = self.gTextField.text.intValue;
        int b = self.bTextField.text.intValue;
        if (0 <= r && r <= 255) {
            if (0 <= g && g <= 255) {
                if (0 <= b && b <= 255) {
                    [[NSUserDefaults standardUserDefaults] setObject:self.textField.text forKey:kDefaultString];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:self.rTextField.text forKey:kColorR];
                    [[NSUserDefaults standardUserDefaults] setObject:self.gTextField.text forKey:kColorG];
                    [[NSUserDefaults standardUserDefaults] setObject:self.bTextField.text forKey:kColorB];
                    
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    NextViewController * nextVC = [[NextViewController alloc] init];
                    nextVC.text = self.textField.text;
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
        _textField.delegate = self;
        _textField.mj_size = CGSizeMake(AppWidth-40, 40);
        _textField.placeholder = @"请输入默认显示的文字";
        NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:kDefaultString];
        if (string) {
            _textField.text = string;
        }
    }
    return _textField;
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
        NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:kColorR];
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
        NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:kColorG];
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
        NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:kColorB];
        if (string) {
            _bTextField.text = string;
        }
    }
    return _bTextField;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_finishButton setTitle:@"确定" forState:UIControlStateNormal];
        [_finishButton addTarget:self action:@selector(finishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_finishButton setBackgroundImage:[UIImage imageWithColor:RGBColor(0x52CBAB)] forState:UIControlStateNormal];
        [_finishButton setBackgroundImage:[UIImage imageWithColor:RGBColor(0x91dec9)] forState:UIControlStateHighlighted];
    }
    return _finishButton;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
//    [self finishButtonClick];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.textField resignFirstResponder];
    [self.rTextField resignFirstResponder];
    [self.gTextField resignFirstResponder];
    [self.bTextField resignFirstResponder];
}

@end
