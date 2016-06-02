//
//  UIApplication+Extensions.m
//  Weibo11
//
//  Created by JYJ on 15/12/8.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "UIApplication+Extensions.h"

@implementation UIApplication (Extensions)

+ (AppDelegate *)appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

+ (UIViewController *)rootViewController {
    return [UIApplication appDelegate].window.rootViewController;
}

+ (UIImage *)launchImage {
    UIImage *image = nil;
    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    
    for (NSDictionary *dict in launchImages) {
        // 1. 将字符串转换成尺寸
        CGSize size = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        // 2. 与当前屏幕进行比较
        if (CGSizeEqualToSize(size, [UIScreen ff_screenSize])) {
            NSString *filename = dict[@"UILaunchImageName"];
            image = [UIImage imageNamed:filename];
            
            break;
        }
    }
    return image;
}

@end
