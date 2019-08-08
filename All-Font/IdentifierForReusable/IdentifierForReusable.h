//
//  UITableViewCell+Identifier.h
//  Test
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IdentifierForReusableHeaderCode + (NSString *)identifierForReusable;\
- (NSString *)identifierForReusable;

@interface UITableViewCell (IdentifierForReusable)

IdentifierForReusableHeaderCode

@end

@interface UICollectionReusableView (IdentifierForReusable)

IdentifierForReusableHeaderCode

@end

@interface UITableViewHeaderFooterView (IdentifierForReusable)

IdentifierForReusableHeaderCode

@end


// Helpful

@interface UITableView (IdentifierForReusable)

/**
 使用类名注册 Cell
 */
- (void)lx_registerCellClass:(Class)cellClass;
/**
 使用类名注册 Header Footer
 */
- (void)lx_registerHeaderFooterClass:(Class)aClass;

- (__kindof UITableViewCell *)lx_dequeueReusableCellWithClass:(Class)cellClass;

- (__kindof UITableViewCell *)lx_dequeueReusableCellWithClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

- (__kindof UITableViewHeaderFooterView *)lx_dequeueReusableHeaderFooterViewWithClass:(Class)aClass;

@end


@interface UICollectionView (IdentifierForReusable)
/**
 使用类名注册 Cell
 */
- (void)lx_registerClass:(Class)cellClass;
/**
 使用类名注册 Header Footer
 */
- (void)lx_registerClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind;

/**
 获取 cell

 @param cellClass cell 的 class
 */
- (__kindof UICollectionViewCell *)lx_dequeueReusableCellWithReuseClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

/**
 获取 UICollectionReusableView
 */
- (__kindof UICollectionReusableView *)lx_dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseClass:(Class)aClass forIndexPath:(NSIndexPath *)indexPath;

@end
