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
    self.view.backgroundColor = [UIColor greenColor];
    self.tabBarItem.badgeValue = @"99";
    [self setupBadgeBackground];
}

/**
 *  设置 Badge 数字的背景图片
 */
- (void)setupBadgeBackground {
    
#warning 当多个控制器需要改变badgeView，请参考IrregularTabBar2项目中的DataViewController
    // 查找_UIBadgeBackground
     UIView *badgeView = [UIView ff_firstInView:self.tabBarController.tabBar.subviews[4] clazzName:@"_UIBadgeBackground"];
    
    // 设置背景图片
    [badgeView setValue:[UIImage imageNamed:@"main_badge"] forKey:@"_image"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
