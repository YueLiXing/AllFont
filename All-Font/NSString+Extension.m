//
//  NSString+Extension.m
//  GeXingWang
//
//  Created by yuelixing on 15/8/20.
//  Copyright (c) 2015年 Tutu. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

-(CGSize)sizeWithAttributes:(NSDictionary *)attributes MaxSize:(CGSize)textSize {
    return [self boundingRectWithSize:textSize options:NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
}

- (NSString *)trimString {
    // 截断字符串中的所有空白字符（空格,\t,\n,\r）
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(BOOL)isChinese {
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

@end


@implementation UILabel (SignleHeight)

- (CGFloat)singleLineHeightForFont:(UIFont *)font {
    return [@"wo" sizeWithFont:font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].height;
}

- (CGFloat)singleLineHeight {
    return [self singleLineHeightForFont:self.font];
}

- (CGSize)sizeOfFullWithWidth:(CGFloat)width {
    return [self.text sizeWithFont:self.font maxSize:CGSizeMake(width, MAXFLOAT)];
}

- (CGSize)sizeOfFull {
    return [self sizeOfFullWithWidth:self.frame.size.width];
}

@end