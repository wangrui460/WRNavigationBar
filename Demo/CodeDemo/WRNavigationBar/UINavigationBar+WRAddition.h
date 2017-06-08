//
//  UINavigationBar+WRAddition.h
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

// =====================================================
#pragma mark - UINavigationBar
// =====================================================
@interface UINavigationBar (WRAddition)

/** 设置导航栏背景颜色*/
- (void)wr_setBackgroundColor:(UIColor *)color;

/** 设置导航栏所有BarButtonItem的透明度 */
- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

/** 设置导航栏在垂直方向上平移多少距离 */
- (void)wr_setTranslationY:(CGFloat)translationY;

/** 清除在导航栏上设置的背景颜色、透明度、位移距离等属性 */
- (void)wr_clear;

@end

// =====================================================
#pragma mark - UIViewController
// =====================================================
@interface UIViewController (WRAddition)

- (BOOL)pushToCurrentVCFinished;
- (void)setPushToCurrentVCFinished:(BOOL)isFinished;

- (BOOL)pushToNextVCFinished;
- (void)setPushToNextVCFinished:(BOOL)isFinished;

- (UIColor *)navBarBarTintColor;
- (void)setNavBarBarTintColor:(UIColor *)color;

- (CGFloat)navBarBackgroundAlpha;
- (void)setNavBarBackgroundAlpha:(CGFloat)alpha;

- (UIColor *)navBarTintColor;
- (void)setNavBarTintColor:(UIColor *)color;

- (UIColor *)navBarTitleColor;
- (void)setNavBarTitleColor:(UIColor *)color;

- (UIStatusBarStyle)statusBarStyle;
- (void)setStatusBarStyle:(UIStatusBarStyle)style;

- (UIView *)customNavBar;
- (void)setCustomNavBar:(UINavigationBar *)navBar;

@end


// ====================================================
#pragma mark - UIColor
// ====================================================
@interface UIColor (WRAddition)

+ (UIColor *)defaultNavBarBarTintColor;
+ (void)setDefaultNavBarBarTintColor:(UIColor *)color;

+ (UIColor *)defaultNavBarTintColor;
+ (void)setDefaultNavBarTintColor:(UIColor *)color;

+ (UIColor *)defaultNavBarTitleColor;
+ (void)setDefaultNavBarTitleColor:(UIColor *)color;

+ (UIStatusBarStyle)defaultStatusBarStyle;
+ (void)setDefaultStatusBarStyle:(UIStatusBarStyle)style;

+ (CGFloat)defaultBackgroundAlpha;

+ (UIColor *)middleColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(CGFloat)percent;
+ (CGFloat)middleAlpha:(CGFloat)fromAlpha toAlpha:(CGFloat)toAlpha percent:(CGFloat)percent;

@end



