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
#import "InsuranceViewController.h"
#import "DataViewController.h"
#import "ProfileViewController.h"

#import "BXTabBar.h"

#define kTabbarHeight 49
#define  kContentFrame  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabbarHeight)
#define  kDockFrame CGRectMake(0, self.view.frame.size.height-kTabbarHeight, self.view.frame.size.width, kTabbarHeight)

@interface BXTabBarController ()<UITabBarControllerDelegate, UINavigationControllerDelegate, BXTabBarDelegate>

@property (nonatomic, assign) BOOL jump;
@property (nonatomic, assign) NSInteger lastSelectIndex;
@property (nonatomic, strong) UIView *redPoint;
/** view */
@property (nonatomic, strong) UIView *mytabbar;

@property (nonatomic, strong) id popDelegate;
/** 保存所有控制器对应按钮的内容（UITabBarItem）*/
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation BXTabBarController

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBar.hidden = YES;
    // 把系统的tabBar上的按钮干掉
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[BXTabBar class]]) {
            [childView removeFromSuperview];
            
        }
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
   
    // 添加所有子控制器
    [self addAllChildVc];
    // 自定义tabBar
    [self setUpTabBar];
}

#pragma mark - 自定义tabBar
- (void)setUpTabBar
{
    
    
    BXTabBar *tabBar = [[BXTabBar alloc] init];
    
    // 存储UITabBarItem
    tabBar.items = self.items;
    
    tabBar.delegate = self;
    
    tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_background"]];;
    
//    tabBar.frame = self.tabBar.bounds;
//    
//    [self.tabBar addSubview:tabBar];
    tabBar.frame = self.tabBar.frame;
    [self.view addSubview:tabBar];
    self.mytabbar = tabBar;
}



/**
 *  添加所有的子控制器
 */
- (void)addAllChildVc {
    // 添加初始化子控制器 BXHomeViewController
    HomeViewController *home = [[HomeViewController alloc] init];
    home.view.backgroundColor = BXRandomColor;
    [self addOneChildVC:home title:@"待办事项" imageName:@"tabBar_icon_schedule_default" selectedImageName:@"tabBar_icon_schedule"];
    
    NewViewController *customer = [[NewViewController alloc] init];
    [self addOneChildVC:customer title:@"客户管理" imageName:@"tabBar_icon_customer_default" selectedImageName:@"tabBar_icon_customer"];
    customer.view.backgroundColor = BXGlobalBg;
    
    InsuranceViewController *insurance = [[InsuranceViewController alloc] init];
    [self addOneChildVC:insurance title:@"上传保单" imageName:@"tab_camera" selectedImageName:@"tab_camera"];
    insurance.view.backgroundColor = BXRandomColor;
    
    DataViewController *compare = [[DataViewController alloc] init];
    [self addOneChildVC:compare title:@"产品对比" imageName:@"tabBar_icon_contrast_default" selectedImageName:@"tabBar_icon_contrast"];
    compare.view.backgroundColor = BXRandomColor;
    
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
    
    // 设置tabbarItem的普通文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:113/255.0 green:109/255.0 blue:104/255.0 alpha:1];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = BXColor(51, 135, 255);
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 记录所有控制器对应按钮的内容
    [self.items addObject:childVc.tabBarItem];
    
    // 添加为tabbar控制器的子控制器
    BXNavigationController *nav = [[BXNavigationController alloc] initWithRootViewController:childVc];

    nav.delegate = self;
    [self addChildViewController:nav];
}

#pragma mark - BXTabBarDelegate方法
// 监听tabBar上按钮的点击
- (void)tabBar:(BXTabBar *)tabBar didClickBtn:(NSInteger)index
{
    self.selectedIndex = index;
}



#pragma mark navVC代理
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *root = navigationController.viewControllers.firstObject;
    if (viewController != root) {
        //更改导航控制器的高度
        navigationController.view.frame = self.view.bounds;
        //从HomeViewController移除
        [self.mytabbar removeFromSuperview];
        // 调整tabbar的Y值
        CGRect dockFrame = self.mytabbar.frame;

        if ([root.view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollview = (UIScrollView *)root.view;
            dockFrame.origin.y = scrollview.contentOffset.y + root.view.frame.size.height - kTabbarHeight;
        } else {
            // dockFrame.origin.y -= kDockHeight;

            dockFrame.origin.y = root.view.frame.size.height - kTabbarHeight;
        }
        _mytabbar.frame = dockFrame;

        
        //添加dock到根控制器界面
        [root.view addSubview:_mytabbar];
    }
}

// 完全展示完调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *root = navigationController.viewControllers.firstObject;
    BXNavigationController *nav = (BXNavigationController *)navigationController;
    if (viewController == root) {
        // 更改导航控制器view的frame
        navigationController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabbarHeight);
        
        navigationController.interactivePopGestureRecognizer.delegate = nav.popDelegate;
        // 让Dock从root上移除
        [_mytabbar removeFromSuperview];
 
        //_mytabbar添加dock到HomeViewController
        _mytabbar.frame = self.tabBar.frame;
        [self.view addSubview:_mytabbar];
    }
}


@end
