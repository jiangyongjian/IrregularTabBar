//
//  BXNavigationController.m
//  BaoXianDaiDai
//
//  Created by JYJ on 15/5/28.
//  Copyright (c) 2015年 baobeikeji.cn. All rights reserved.
//

#import "BXNavigationController.h"

@interface BXNavigationController () <UINavigationControllerDelegate>
//@property (nonatomic, strong) id popDelegate;
@end

@implementation BXNavigationController

+ (void)initialize {
    // 设置UIUINavigationBar的主题
    [self setupNavigationBarTheme];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}

/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupNavigationBarTheme {
    // 通过appearance对象能修改整个项目中所有UIBarbuttonItem的样式
    UINavigationBar *appearance = [UINavigationBar appearance];

    // 1.设置导航条的背景
    [appearance setBackgroundImage:[UIImage createImageWithColor:The_MainColor] forBarMetrics:UIBarMetricsDefault];
    
    // 设置文字
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:att];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {// 如果现在push的不是栈底控制器(最先push进来的那个控制器)
//        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -5;
        
        //设置导航栏的按钮
       UIBarButtonItem *backButton = [UIBarButtonItem itemWithImageName:@"navigationbar_back_image" highImageName:@"navigationbar_back_image" target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
        
        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    [super pushViewController:viewController animated:animated];
}

//// 完全展示完调用
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    // 如果展示的控制器是根控制器，就还原pop手势代理
//    if (viewController == [self.viewControllers firstObject]) {
//        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
//    }
//}

- (void)back {
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
