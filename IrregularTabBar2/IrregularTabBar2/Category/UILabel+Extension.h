//
//  UILabel+Extension.h
//  Weibo11
//
//  Created by JYJ on 15/12/5.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
* 创建 UILabel
*
*  @param title    标题
*  @param color    标题颜色
*  @param fontSize 字体大小
*
*  @return UILabel(文本水平居中)
*/
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize;


/**
 * 创建 UILabel
 *
 *  @param title    标题
 *  @param color    标题颜色
 *  @param font     字体
 *
 *  @return UILabel(文本水平居中)
 */
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;


/**
 *  创建 UILabel
 *
 *  @param title     标题
 *  @param color     标题颜色
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *
 *  @return UILabel
 */
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;


/**
 *  创建 UILabel
 *
 *  @param title     标题
 *  @param color     标题颜色
 *  @param font      字体
 *  @param alignment 对齐方式
 *
 *  @return UILabel
 */
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)alignment;

@end
