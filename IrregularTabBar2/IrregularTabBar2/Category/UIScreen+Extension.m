//
//  UIScreen+Extension.m
//  Weibo11
//
//  Created by JYJ on 15/12/8.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

+ (CGSize)ff_screenSize {
    return [UIScreen mainScreen].bounds.size;
}

+ (BOOL)ff_isRetina {
    return [UIScreen ff_scale] >= 2;
}

+ (CGFloat)ff_scale {
    return [UIScreen mainScreen].scale;
}

@end
