//
//  BXTabBar.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "BXTabBar.h"
#import "BXTabBarBigButton.h"
#import "InsuranceViewController.h"
#import "BXNavigationController.h"

@interface BXTabBar ()
/** bigButton */
@property (nonatomic, strong) BXTabBarBigButton *bigButton;
@end

@implementation BXTabBar
- (BXTabBarBigButton *)bigButton {
    if (!_bigButton) {
        BXTabBarBigButton *bigButton = [[BXTabBarBigButton alloc] init];
        [bigButton setImage:[UIImage imageNamed:@"摄影机图标_点击前"] forState:UIControlStateNormal];
        [bigButton setImage:[UIImage imageNamed:@"摄影机图标_点击后"] forState:UIControlStateHighlighted];
        [bigButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bigButton addTarget:self action:@selector(bigButtonClick) forControlEvents:UIControlEventTouchUpInside];
        self.bigButton = bigButton;
    }
    return _bigButton;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bigButton];
    }
    return self;
}

#warning TODO 点击按钮需要做的事情
- (void)bigButtonClick {
    BXLog(@"大按钮点击了");
    InsuranceViewController *vc = [[InsuranceViewController alloc] init];
    BXNavigationController *nav = [[BXNavigationController alloc] initWithRootViewController:vc];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置bigButton的frame
    CGRect rect = self.bounds;
    CGFloat w = rect.size.width / self.items.count - 1;
    self.bigButton.frame = CGRectInset(rect, 2 * w, 0);
    self.bigButton.height = 49;
    [self bringSubviewToFront:self.bigButton];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    
    // 因为按钮内部imageView突出
    CGPoint newPoint = [self convertPoint:point toView:self.bigButton.imageView];
    
    if ( [self.bigButton.imageView pointInside:newPoint withEvent:event]) { // 点属于按钮范围
        return self.bigButton;
        
    }else{
        return [super hitTest:point withEvent:event];
    }


    return [super hitTest:point withEvent:event];
}

@end
