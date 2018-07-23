//
//  NSUserDefaults+KeyValue.h
//  ChatDemo
//
//  Created by yuelixing on 2016/10/19.
//  Copyright © 2016年 Tutu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (KeyValue)

+ (BOOL)saveObject:(nullable id)object Key:(nonnull NSString *)key;
+ (BOOL)saveBool:(BOOL)object Key:(nonnull NSString *)key;

+ (BOOL)removeObject:(nonnull NSString *)key;

+ (nullable id)objectForKey:(nonnull NSString *)key;
+ (BOOL)boolForKey:(nonnull NSString *)key;


+ (nullable id)objectForKey:(nonnull NSString *)key DefaultValue:(nullable id)defaultValue;
+ (BOOL)boolForKey:(nonnull NSString *)key DefaultValue:(BOOL)defaultValue;

@end
