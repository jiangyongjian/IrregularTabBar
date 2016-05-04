//
//  UIView+Runtime.m
//  Weibo11
//
//  Created by JYJ on 15/12/12.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "UIView+Runtime.h"
#import <objc/runtime.h>

@implementation UIView (Runtime)
/// 查找视图 KEY
const char *FF_FIND_VIEW_KEY;

#pragma mark - 查找子视图
+ (UIView *)findView {
    return objc_getAssociatedObject(self, FF_FIND_VIEW_KEY);
}

+ (void)setFindView:(UIView *)findView {
    objc_setAssociatedObject(self, FF_FIND_VIEW_KEY, findView, OBJC_ASSOCIATION_ASSIGN);
}

+ (UIView *)ff_firstInView:(UIView *)view clazzName:(NSString *)clazzName {
    
    // 递归出口
    if ([self.findView isKindOfClass:NSClassFromString(clazzName)]) {
        return self.findView;
    }
    
    // 遍历所有子视图
    for (UIView *subView in view.subviews) {
        
        // 如果是要查找的类，记录并且返回
        if ([subView isKindOfClass:NSClassFromString(clazzName)]) {
            self.findView = subView;
            break;
        } else {
            // 使用子视图递归调用
            [self ff_firstInView:subView clazzName:clazzName];
        }
    }
    
    return self.findView;
}

#pragma mark - 遍历当前视图的内部细节 - 仅供测试使用
/// 遍历当前视图的成员变量 - 仅供测试使用
- (void)ff_ivarsList {
        
    uint32_t count = 0;
    // 获取成员变量列表
    Ivar *ivars = class_copyIvarList(self.class, &count);
    
    for (UInt32 i = 0; i < count; ++i) {
        Ivar ivar = ivars[i];
        
        const char *cName = ivar_getName(ivar);
        NSString *name = [[NSString alloc] initWithUTF8String:cName];

        NSLog(@"%@", name);
    }
    
    // 释放成员变量列表
    free(ivars);
}

@end
