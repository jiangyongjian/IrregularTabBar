//
//  DataViewController.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.tabBarItem.badgeValue = @"99";
    [self setupBadgeBackground];
}

/**
 *  设置 Badge 数字的背景图片
 */
- (void)setupBadgeBackground {
    
    /**
     *  在多个控制器中需要设置bageView的图片或者位置时，下面代码不能调换顺序
     *   UIView *badgeView = [UIView ff_firstInView:self.tabBarController.tabBar.subviews[4] clazzName:@"_UIBadgeView"];
     *  UIView *badgeBackground = [UIView ff_firstInView:badgeView clazzName:@"_UIBadgeBackground"];
     *  在只有   一个控制器需要设置小红点的图片，不需要改变位置   的时候，上面代码可以化简为一行代码
     *  UIView *badgeView = [UIView ff_firstInView:self.tabBarController.tabBar.subviews[4] clazzName:@"_UIBadgeBackground"];
     */

#warning 这里的4  是对应的当前控制器第几个 + 1，在不同控制器里面需要做相应的修改
    
    // 这句代码是运行时，取出要查找的视图
    UIView *badgeView = [UIView ff_firstInView:self.tabBarController.tabBar.subviews[4] clazzName:@"_UIBadgeView"];
    
    BXLog(@"badgeView -- %@", NSStringFromCGRect(badgeView.frame));
    
    [badgeView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
#warning 修改宽度是可以的，修改x，y值是没有用的，系统会再次帮你改回来
    [badgeView setValue:[NSValue valueWithCGRect:CGRectMake(-100, -100, 40, 18)] forKey:@"frame"];
    
    // 虽然这里打印出来了，但是系统还会调用
    BXLog(@"badgeView2 -- %@", NSStringFromCGRect(badgeView.frame));
    
    
    // 查找 _UIBadgeBackground
//    UIView *badgeBackground = [UIView ff_firstInView:self.tabBarController.tabBar.subviews[4] clazzName:@"_UIBadgeBackground"];
     UIView *badgeBackground = [UIView ff_firstInView:badgeView clazzName:@"_UIBadgeBackground"];
    
    BXLog(@"当前控制器对应的UITabBarButton%@ ---- \n\n\n tabbar上所有的子控件%@ ",self.tabBarController.tabBar.subviews[4], self.tabBarController.tabBar.subviews);
    
#warning _UIBadgeBackground很多人想知道这个是怎么出来的，下面这个方法是打印子控件类名
    [self logSubviewsClass:self.tabBarController.tabBar.subviews[4]];

    // 测试内部成员变量列表
    [badgeBackground ff_ivarsList];
    
    BXLog(@"badgeBackground -- %@", NSStringFromCGRect(badgeBackground.frame));
    
    // 设置背景图片
#warning 这里设置图片，你项目需要的图片
    [badgeBackground setValue:[UIImage imageNamed:@"m_badge"] forKey:@"_image"];
    
}

/**
 *  kVO
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    BXLog(@"%@", change);
}

/**
 *  打印所有子控件的Class
 */
- (void)logSubviewsClass:(UIView *)view {
    NSLog(@"%@", [view class]);
    for (UIView *subview in view.subviews) {
        [self logSubviewsClass:subview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
