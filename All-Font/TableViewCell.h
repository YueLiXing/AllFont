//
//  TableViewCell.h
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UITableView+FDTemplateLayoutCell.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isSingleLine;
@property (nonatomic, assign) CGFloat fontSize;

- (void)setTitle:(NSString *)title SubTitle:(NSString *)subTitle FontName:(NSString *)fontName Color:(UIColor *)color;

@end
