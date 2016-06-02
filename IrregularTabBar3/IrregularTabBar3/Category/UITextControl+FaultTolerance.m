//
//  UITextControl+FaultTolerance.m
//  BaoXianDaiDai
//
//  Created by linsihua on 16/4/5.
//  Copyright © 2016年 baobeikeji.cn. All rights reserved.
//

#import <objc/message.h>
#import <objc/runtime.h>

@implementation UILabel (FaultTolerance)

+ (void)initialize {
    // 获取到UILabel中setText对应的method
    Method setText = class_getInstanceMethod([UILabel class], @selector(setText:));
    Method setTextHooked = class_getInstanceMethod([UILabel class], @selector(setTextHooked:));
    
    // 将目标函数的原实现绑定到setTextOriginal:方法上
    IMP setTextImp = method_getImplementation(setText);
    class_addMethod([UILabel class], @selector(setTextOriginal:), setTextImp, method_getTypeEncoding(setText));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP setTextHookedImp = method_getImplementation(setTextHooked);
    class_replaceMethod([UILabel class], @selector(setText:), setTextHookedImp, method_getTypeEncoding(setText));
}

- (void)setTextHooked:(NSString *)text {
    // 容错
    if ([text isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)text;
        text = [NSString stringWithFormat:@"%zd", number.integerValue];
    }
    if (![text isKindOfClass:[NSString class]]) {
        text = @"";
    }
    [self performSelector:@selector(setTextOriginal:) withObject:text];
}

@end

@implementation UITextView (FaultTolerance)

+ (void)initialize {
    // 获取到UITextView中setText对应的method
    Method setText = class_getInstanceMethod([UITextView class], @selector(setText:));
    Method setTextHooked = class_getInstanceMethod([UITextView class], @selector(setTextHooked:));
    
    // 将目标函数的原实现绑定到setTextOriginal:方法上
    IMP setTextImp = method_getImplementation(setText);
    class_addMethod([UITextView class], @selector(setTextOriginal:), setTextImp, method_getTypeEncoding(setText));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP setTextHookedImp = method_getImplementation(setTextHooked);
    class_replaceMethod([UITextView class], @selector(setText:), setTextHookedImp, method_getTypeEncoding(setText));
}

- (void)setTextHooked:(NSString *)text {
    // 容错
    if ([text isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)text;
        text = [NSString stringWithFormat:@"%zd", number.integerValue];
    }
    if (![text isKindOfClass:[NSString class]]) {
        text = @"";
    }
    
    [self performSelector:@selector(setTextOriginal:) withObject:text];
}

@end

@implementation UITextField (FaultTolerance)

+ (void)initialize {
    // 获取到UITextField中setText对应的method
    Method setText = class_getInstanceMethod([UITextField class], @selector(setText:));
    Method setTextHooked = class_getInstanceMethod([UITextField class], @selector(setTextHooked:));
    
    // 将目标函数的原实现绑定到setTextOriginal:方法上
    IMP setTextImp = method_getImplementation(setText);
    class_addMethod([UITextField class], @selector(setTextOriginal:), setTextImp, method_getTypeEncoding(setText));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP setTextHookedImp = method_getImplementation(setTextHooked);
    class_replaceMethod([UITextField class], @selector(setText:), setTextHookedImp, method_getTypeEncoding(setText));
}

- (void)setTextHooked:(NSString *)text {
    // 容错
    if ([text isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)text;
        text = [NSString stringWithFormat:@"%zd", number.integerValue];
    }
    if (![text isKindOfClass:[NSString class]]) {
        text = @"";
    }
    [self performSelector:@selector(setTextOriginal:) withObject:text];
}

@end

@implementation UIButton (FaultTolerance)

+ (void)initialize {
    // 获取到UITextField中setText对应的method
    Method setTitleForState = class_getInstanceMethod([UIButton class], @selector(setTitle:forState:));
    Method setTitleForStateHooked = class_getInstanceMethod([UIButton class], @selector(setTitle:forStateHooked:));
    
    // 将目标函数的原实现绑定到setTitle:forStateOriginal:方法上
    IMP setTitleForStateImp = method_getImplementation(setTitleForState);
    class_addMethod([UIButton class], @selector(setTitle:forStateOriginal:), setTitleForStateImp, method_getTypeEncoding(setTitleForState));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP setTitleForStateHookedImp = method_getImplementation(setTitleForStateHooked);
    class_replaceMethod([UIButton class], @selector(setTitle:forState:), setTitleForStateHookedImp, method_getTypeEncoding(setTitleForState));
}

- (void)setTitle:(NSString *)title forStateHooked:(UIControlState)state {
    // 容错
    if ([title isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)title;
        title = [NSString stringWithFormat:@"%zd", number.integerValue];
    }
    if (![title isKindOfClass:[NSString class]]) {
        title = @"";
    }
    
    typedef void (*BXMsgSend)(id, SEL, NSString *, UIControlState);
    BXMsgSend msgSend = (BXMsgSend)objc_msgSend;
    msgSend(self, @selector(setTitle:forStateOriginal:), title, state);
}

@end