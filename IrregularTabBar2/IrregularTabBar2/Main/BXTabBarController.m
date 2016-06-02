//
//  BXTabBarController.m
//  BaoXianDaiDai
//
//  Created by JYJ on 15/5/28.
//  Copyright (c) 2015年 baobeikeji.cn. All rights reserved.
//

#import "BXTabBarController.h"
#import "BXNavigationController.h"
#import "HomeViewController.h"
#import "NewViewController.h"
#import "DataViewController.h"
#import "ProfileViewController.h"

#import "BXTabBar.h"

#define kTabbarHeight 49

@interface BXTabBarController ()

@end

@implementation BXTabBarController
+ (void)initialize {
    // 设置tabbarItem的普通文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:113/255.0 green:109/255.0 blue:104/255.0 alpha:1];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = BXColor(51, 135, 255);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self addAllChildVc];
    // 自定义tabBar
    [self setUpTabBar];
}
#pragma mark - 自定义tabBar
- (void)setUpTabBar
{
    BXTabBar *myTabBar = [[BXTabBar alloc] init];
    // 更换tabBar
    [self setValue:myTabBar forKey:@"tabBar"];
}



/**
 *  添加所有的子控制器
 */
- (void)addAllChildVc {
    // 添加初始化子控制器 BXHomeViewController
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addOneChildVC:home title:@"首页" imageName:@"tabBar_icon_schedule_default" selectedImageName:@"tabBar_icon_schedule"];
    
    NewViewController *customer = [[NewViewController alloc] init];
    [self addOneChildVC:customer title:@"新闻" imageName:@"tabBar_icon_customer_default" selectedImageName:@"tabBar_icon_customer"];
    
    // 添加一个空白控制器
    [self addChildViewController:[[UIViewController alloc] init]];
    
    DataViewController *compare = [[DataViewController alloc] init];
    [self addOneChildVC:compare title:@"发现" imageName:@"tabBar_icon_contrast_default" selectedImageName:@"tabBar_icon_contrast"];
    
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    [self addOneChildVC:profile title:@"我的" imageName:@"tabBar_icon_mine_default" selectedImageName:@"tabBar_icon_mine"];
    profile.view.backgroundColor = BXRandomColor;
}


/**
 *  添加一个自控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */

- (void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 设置标题
    childVc.tabBarItem.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    BXNavigationController *nav = [[BXNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
