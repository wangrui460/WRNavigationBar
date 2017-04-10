//
//  UINavigationBar+WRAddition.m
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "UINavigationBar+WRAddition.h"
#import <objc/runtime.h>

@implementation UINavigationBar (WRAddition)

static char kBackgroundViewKey;

- (UIView*)backgroundView
{
    return objc_getAssociatedObject(self, &kBackgroundViewKey);
}

- (void)setBackgroundView:(UIView*)backgroundView
{
    objc_setAssociatedObject(self, &kBackgroundViewKey, backgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)wr_setBackgroundColor:(UIColor *)color
{
    if (self.backgroundView == nil)
    {
        // 设置导航栏本身全透明
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        // _UIBarBackground是导航栏的第一个自控制器
        [self.subviews.firstObject insertSubview:self.backgroundView atIndex:0];
        // 隐藏导航栏底部默认黑线
        [self setShadowImage:[UIImage new]];
    }
    self.backgroundView.backgroundColor = color;
}

- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha
{
    for (UIView *view in self.subviews)
    {
        if (![view.subviews.firstObject isEqual:self.backgroundView]) {
            view.alpha = alpha;
        }
    }
}

- (void)wr_setTranslationY:(CGFloat)translationY
{
    // CGAffineTransformMakeTranslation  平移
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)wr_clear
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
}

@end
