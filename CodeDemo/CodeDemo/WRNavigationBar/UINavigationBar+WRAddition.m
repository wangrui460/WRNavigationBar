//
//  UINavigationBar+WRAddition.m
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "UINavigationBar+WRAddition.h"
#import <objc/runtime.h>

// TODO: 返回的时候有白块
// TODO: 跳转下一个页面的时候回跳一下

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

- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator
{
    for (UIView *view in self.subviews)
    {
        if (hasSystemBackIndicator == YES)
        {
            // _UIBarBackground对应的view是系统导航栏，不需要改变其透明度
            if (![view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                view.alpha = alpha;
            }
        }
        else
        {
            // 这里如果不做判断的话，会显示 backIndicatorImage
            if (![view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] && ![view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                view.alpha = alpha;
            }
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
    // 设置导航栏不透明
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        __strong typeof(self) pThis = weakSelf;
        [pThis.backgroundView removeFromSuperview];
        pThis.backgroundView = nil;
    });
}

@end

///////////////////////////////////////////////////////////////////////////////////////////
@implementation UINavigationController (ShouldPopOnBackButton)

// 加上一个这样的分类和方法可以解决返回熊猫美妆界面时，导航栏过一段时间再透明的问题（如果觉得没必要可以去掉）
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    if ([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [self popViewControllerAnimated:YES];
    });
    return NO;
}

@end

