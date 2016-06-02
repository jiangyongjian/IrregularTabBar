//
//  UIDevice+DeviceType.h
//  honeyshare
//
//  Created by LLY on 14-11-14.
//  Copyright (c) 2014年 意会信息科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIDevice (DeviceType)
/**
 *  返回设备型号
 */
+ (NSString *)platformString;

/**
 *  根据不同的设置返回不同的字体
 */
+(UIFont*)returnDifferentDeviceFont:(NSInteger)integer;

@end
