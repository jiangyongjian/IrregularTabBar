//
//  UIButton+Extension.h
//  Weibo11
//
//  Created by JYJ on 15/12/5.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)


/**
 *  创建按钮有文字,有颜色,有字体,有图片,没有有背景
 *
 *  @param title         标题
 *  @param color         字体颜色
 *  @param fontSize      字号
 *  @param imageName     图像
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action;

/**
 *  创建按钮有文字,有颜色,有字体,有图片,有背景
 *
 *  @param title         标题
 *  @param color         字体颜色
 *  @param fontSize      字号
 *  @param imageName     图像
 *  @param backImageName 背景图像
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action backImageName:(NSString *)backImageName;


/**
 *  创建按钮有文字,有颜色，有字体，没有图片，没有背景
 *
 *  @param title         标题
 *  @param titleColor    标题颜色
 *  @param backImageName 背景图像名称
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;

/**
 *  创建按钮有文字,有颜色，有字体，没有图片，有背景
 *
 *  @param title         标题
 *  @param titleColor    标题颜色
 *  @param backImageName 背景图像名称
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action backImageName:(NSString *)backImageName;

@end
