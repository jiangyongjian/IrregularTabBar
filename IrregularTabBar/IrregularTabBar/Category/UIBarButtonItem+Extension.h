//
//  UIBarButtonItem+Extension.h
//  JYJ微博
//
//  Created by JYJ on 15/3/11.
//  Copyright (c) 2015年 JYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  返回没有调整图片
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:target action:(SEL)action;

/**
 *  没有文字调整的按钮
 */
+ (UIBarButtonItem *)itemWithName:(NSString *)Name font:(CGFloat)font target:target action:(SEL)action;

/**
 *  返回调整文字
 */
+ (NSArray *)itemsWithName:(NSString *)Name font:(CGFloat)font target:target action:(SEL)action;

/**
 *  返回调整图片
 */
+ (NSArray *)itemsWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:target action:(SEL)action;
@end
