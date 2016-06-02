//
//  NSDictionary+Extension.h
//  BXInsurenceBroker
//
//  Created by linsihua on 16/4/9.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

- (id)getValue:(NSString *)key as:(Class)type;

- (id)getValue:(NSString *)key as:(Class)type defaultValue:(id)defaultValue;

@end
