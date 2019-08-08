 //
//  UITableViewCell+Identifier.m
//  Test
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "IdentifierForReusable.h"

#define IdentifierForReusableCode + (NSString *)identifierForReusable {\
return NSStringFromClass(self);\
}\
- (NSString *)identifierForReusable {\
    return [[self class] identifierForReusable];\
}


@implementation UITableViewCell (IdentifierForReusable)

IdentifierForReusableCode

@end

@implementation UICollectionReusableView (IdentifierForReusable)

IdentifierForReusableCode

@end

@implementation UITableViewHeaderFooterView (IdentifierForReusable)

IdentifierForReusableCode

@end

@implementation UITableView (IdentifierForReusable)

- (void)checkCellClass:(Class)cellClass {
    NSAssert(cellClass, @"cellClass 不可为空");
    NSAssert([cellClass isSubclassOfClass:[UITableViewCell class]], @"cellClass 必须是 UITableViewCell的子类");
    NSAssert([cellClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
}

- (void)checkHeaderFooterViewWithClass:(Class)aClass {
    NSAssert(aClass, @"aClass 不可为空");
    NSAssert([aClass isSubclassOfClass:[UITableViewHeaderFooterView class]], @"class 必须是 UITableViewHeaderFooterView的子类");
    NSAssert([aClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
}


- (void)lx_registerCellClass:(Class)cellClass {
    [self checkCellClass:cellClass];
    [self registerClass:cellClass forCellReuseIdentifier:[cellClass identifierForReusable]];
}
- (void)lx_registerHeaderFooterClass:(Class)aClass {
    [self checkHeaderFooterViewWithClass:aClass];
    [self registerClass:aClass forHeaderFooterViewReuseIdentifier:[aClass identifierForReusable]];
}

- (nullable __kindof UITableViewCell *)lx_dequeueReusableCellWithClass:(Class)cellClass {
    [self checkCellClass:cellClass];
    return [self dequeueReusableCellWithIdentifier:[cellClass identifierForReusable]];
}
- (__kindof UITableViewCell *)lx_dequeueReusableCellWithClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath {
    [self checkCellClass:cellClass];
    NSAssert(indexPath, @"indexPath 不可为空");
    return [self dequeueReusableCellWithIdentifier:[cellClass identifierForReusable] forIndexPath:indexPath];
}
- (nullable __kindof UITableViewHeaderFooterView *)lx_dequeueReusableHeaderFooterViewWithClass:(Class)aClass {
    [self checkHeaderFooterViewWithClass:aClass];
    return [self dequeueReusableHeaderFooterViewWithIdentifier:[aClass identifierForReusable]];
}


@end


@implementation UICollectionView (IdentifierForReusable)

- (void)checkCellClass:(Class)cellClass {
    NSAssert(cellClass, @"cellClass 不可为空");
    NSAssert([cellClass isSubclassOfClass:[UICollectionViewCell class]], @"cellClass 必须是 UICollectionViewCell的子类");
    NSAssert([cellClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
}

- (void)checkSupplementaryViewClass:(Class)aClass Kind:(NSString *)kind {
    NSAssert(aClass, @"aClass 不可为空");
    NSAssert(kind, @"kind 不可为空");
    NSAssert([kind isKindOfClass:[NSString class]], @"kind 必须为 NSString");
    NSAssert([aClass isSubclassOfClass:[UICollectionReusableView class]], @"cellClass 必须是 UICollectionReusableView的子类");
    NSAssert([aClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
}



- (void)lx_registerClass:(Class)cellClass {
    [self checkCellClass:cellClass];
    [self registerClass:cellClass forCellWithReuseIdentifier:[cellClass identifierForReusable]];
}

- (void)lx_registerClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind {
    [self checkSupplementaryViewClass:aClass Kind:kind];
    [self registerClass:aClass forSupplementaryViewOfKind:kind withReuseIdentifier:[aClass identifierForReusable]];
}

- (__kindof UICollectionViewCell *)lx_dequeueReusableCellWithReuseClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath {
    [self checkCellClass:cellClass];
    return [self dequeueReusableCellWithReuseIdentifier:[cellClass identifierForReusable] forIndexPath:indexPath];
}
- (__kindof UICollectionReusableView *)lx_dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseClass:(Class)aClass forIndexPath:(NSIndexPath *)indexPath {
    [self checkSupplementaryViewClass:aClass Kind:elementKind];
    return [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:[aClass identifierForReusable] forIndexPath:indexPath];
}

@end
