//
//  BXTabBarBigButton.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "BXTabBarBigButton.h"

@interface BXTabBarBigButton ()
/**
 *  背景
 */
@property(nonatomic, weak) UIView *bgView;
@end

@implementation BXTabBarBigButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 2.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_iconIrregular"]];
        [self insertSubview:bgView atIndex:0];
        self.bgView = bgView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = 16;
    self.titleLabel.y = self.height - self.titleLabel.height;
    
    self.imageView.width = self.currentImage.size.width;
    self.imageView.height = self.currentImage.size.height;
    self.imageView.x = (self.width - self.imageView.width) / 2;
    self.imageView.y = self.titleLabel.y - self.imageView.height + 2;
    
    self.bgView.width = 49;
    self.bgView.height = self.height;
    self.bgView.x = (self.width - self.bgView.width) / 2;
    self.bgView.y = 0;
}

- (void)setHighlighted:(BOOL)highlighted {

}
@end
