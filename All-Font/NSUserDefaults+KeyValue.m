//
//  NSUserDefaults+KeyValue.m
//  ChatDemo
//
//  Created by yuelixing on 2016/10/19.
//  Copyright © 2016年 Tutu. All rights reserved.
//

#import "NSUserDefaults+KeyValue.h"

@implementation NSUserDefaults (KeyValue)

+ (BOOL)saveObject:(id)object Key:(NSString *)key {
    if (key == nil) {
        return NO;
    }
    if (object == nil) {
        [[self standardUserDefaults] removeObjectForKey:key];
    } else {
        [[self standardUserDefaults] setObject:object forKey:key];
    }
    return [[self standardUserDefaults] synchronize];
}

+ (BOOL)saveBool:(BOOL)object Key:(NSString *)key {
    return [self saveObject:@(object) Key:key];
}

+ (BOOL)removeObject:(NSString *)key {
    [[self standardUserDefaults] removeObjectForKey:key];
    return [[self standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)key {
    return [self objectForKey:key DefaultValue:nil];
}

+ (BOOL)boolForKey:(NSString *)key {
    return [[self objectForKey:key] boolValue];
}

+ (id)objectForKey:(NSString *)key DefaultValue:(id)defaultValue {
    id temp = [[self standardUserDefaults] objectForKey:key];
    if (temp) {
        return temp;
    } else {
        return defaultValue;
    }
}

+ (BOOL)boolForKey:(NSString *)key DefaultValue:(BOOL)defaultValue {
    return [[self objectForKey:key DefaultValue:@(defaultValue)] boolValue];
}

@end
