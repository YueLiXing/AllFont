//
//  NSString+Extension.h
//  GeXingWang
//
//  Created by yuelixing on 15/8/20.
//  Copyright (c) 2015年 Tutu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)


/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithAttributes:(NSDictionary *)attributes MaxSize:(CGSize)textSize;
/**
 *  截断收尾空白字符
 */
- (NSString *)trimString;

-(BOOL)isChinese;

@end


@interface UILabel (SignleHeight)

/**
 *  指定字体下的当行高度
 */
- (CGFloat)singleLineHeightForFont:(UIFont *)font;
/**
 *  当前字体下的单行高度
 */
- (CGFloat)singleLineHeight;
/**
 *  指定宽度下当前size应为多大
 */
- (CGSize)sizeOfFullWithWidth:(CGFloat)width;
/**
 *  在当前字体大小和大小下size应为多大
 */
- (CGSize)sizeOfFull;

@end