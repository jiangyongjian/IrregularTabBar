//
//  ProfileViewController.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *push = [[UIButton alloc] init];
    push.frame = CGRectMake(100, 100, 100, 100);
    push.backgroundColor = [UIColor redColor];
    [push addTarget:self action:@selector(pushvC)];
    [self.view addSubview:push];
    self.tabBarItem.badgeValue = @"99";
}

- (void)pushvC {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
