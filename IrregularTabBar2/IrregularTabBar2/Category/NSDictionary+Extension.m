//
//  NSDictionary+Extension.m
//  BXInsurenceBroker
//
//  Created by linsihua on 16/4/9.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (id)getValue:(NSString *)key as:(Class)type {
    id value = [self objectForKey:key];
    
    // 类型一样，直接返回
    if ([value isKindOfClass:type]) {
        return value;
    }
    
    // 如果目标是number
    if (type == [NSNumber class] && [value isKindOfClass:[NSString class]]) {
        NSString *string = value;
        if ([string isEqualToString:@"true"]) {
            return @YES;
        }
        if ([string isEqualToString:@"no"]) {
            return @NO;
        }
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        return [formatter numberFromString:string];
    }
    
    // 如果目标是string
    if (type == [NSString class] && [value isKindOfClass:[NSNumber class]]) {
        return [value description];
    }
    if (type == [NSMutableString class]) {
        if ([value isKindOfClass:[NSNumber class]]) {
            return [[value description] mutableCopy];
        } else if ([value isKindOfClass:[NSString class]]) {
            return [value mutableCopy];
        }
    }
    
    // 如果目标是array
    if (type == [NSArray class] && [value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)value;
        return dict.allValues;
    }
    if (type == [NSMutableArray class]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)value;
            return [dict.allValues mutableCopy];
        } else if ([value isKindOfClass:[NSDictionary class]]) {
            return [value mutableCopy];
        }
    }
    
    // 如果目标是dictionary
    if ((type == [NSDictionary class] || type == [NSMutableDictionary class]) && [value isKindOfClass:[NSArray class]]) {
        NSArray *array = (NSArray *)value;
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        for (id item in array) {
            if ([item isKindOfClass:[NSNumber class]]) {
                [dict setObject:item forKey:[item description]];
            } else {
                [dict setObject:item forKey:item];
            }
        }
        return dict;
    }
    
    return nil;
}

- (id)getValue:(NSString *)key as:(Class)type defaultValue:(id)defaultValue {
    id result = [self getValue:key as:type];
    if (!result) {
        result = defaultValue;
    }
    
    return result;
}

@end
