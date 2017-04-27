//
//  NewViewController.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *push = [[UIButton alloc] init];
    push.frame = CGRectMake(100, 100, 100, 100);
    push.backgroundColor = [UIColor redColor];
    [push addTarget:self action:@selector(pushvC)];
    [self.view addSubview:push];
    // 设置小红点
    self.tabBarItem.badgeValue = @"2";
    [self setupBadgeBackground];
}
#warning 详细说明请看DataViewController
/**
 *  设置 Badge 数字的背景图片
 */
- (void)setupBadgeBackground {
#warning 在多个控制器中需要设置bageView的图片或者位置时，下面代码不能调换顺序
    UIView *badgeView = [UIView ff_firstInView:self.tabBarController.tabBar.subviews[2] clazzName:@"_UIBadgeView"];
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        UIView *badgeBackgroundUIImageView = [UIView ff_firstInView:badgeView clazzName:@"UIImageView"];
        UIImageView *cirleUIImageView = (UIImageView *)badgeBackgroundUIImageView;
        //    cirleUIImageView.contentMode = UIViewContentModeScaleToFill;
        cirleUIImageView.image = [UIImage resizedImage:@"m_badge"];
    } else {
        // 查找 _UIBadgeBackground
        UIView *badgeBackground = [UIView ff_firstInView:badgeView clazzName:@"_UIBadgeBackground"];

        // 设置背景图片
        [badgeBackground setValue:[UIImage imageNamed:@"m_badge"] forKey:@"_image"];
    }
}



- (void)pushvC {
    NewViewController *new = [[NewViewController alloc] init];
    
    [self.navigationController pushViewController:new animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"new -- %zd", indexPath.row];
    return cell;
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
