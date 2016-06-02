//
//  NSString+BXExtension.h
//  BXInsurenceBroker
//
//  Created by JYJ on 16/2/23.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BXExtension)
/**
 *手机号码验证 MODIFIED BY HELENSONG
 */
- (BOOL) isValidateMobile;
///**
// *身份证验证
// */
//- (BOOL)validateIdentityCard;
/**
 * 判断字段是否包含空格
 */
- (BOOL)validateContainsSpace;

/**
 *  根据生日返回年龄
 */
- (NSString *)ageFromBirthday;

/**
 *  根据身份证返回岁数
 */
- (NSString *)ageFromIDCard;

/**
 *  根据身份证返回生日
 */
- (NSString*)birthdayFromIDCard;

/**
 *  根据身份证返回性别
 */
- (NSString*)sexFromIDCard;

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)stringWithMoneyAmount:(double)amount;

+ (NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end;

//邮箱
+ (BOOL)validateEmail:(NSString *)email;

- (BOOL)isEmptyString;
@end
