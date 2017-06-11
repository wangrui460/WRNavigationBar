//
//  UINavigationBar+WRAddition.h
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark - UIColor
@interface UIColor (WRAddition)

/** set default barTintColor of UINavigationBar */
+ (void)wr_setDefaultNavBarBarTintColor:(UIColor *)color;

/** set default tintColor of UINavigationBar */
+ (void)wr_setDefaultNavBarTintColor:(UIColor *)color;

/** set default titleColor of UINavigationBar */
+ (void)wr_setDefaultNavBarTitleColor:(UIColor *)color;

/** set default statusBarStyle of UIStatusBar */
+ (void)wr_setDefaultStatusBarStyle:(UIStatusBarStyle)style;

@end




#pragma mark - UINavigationBar
@interface UINavigationBar (WRAddition) <UINavigationBarDelegate>

/** 设置导航栏背景颜色*/
- (void)wr_setBackgroundColor:(UIColor *)color;

/** 设置导航栏所有BarButtonItem的透明度 */
- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

/** 设置导航栏在垂直方向上平移多少距离 */
- (void)wr_setTranslationY:(CGFloat)translationY;

/** 清除在导航栏上设置的背景颜色、透明度、位移距离等属性 */
- (void)wr_clear;

@end




#pragma mark - UIViewController
@interface UIViewController (WRAddition)

- (UIColor *)wr_navBarBarTintColor;
- (void)wr_setNavBarBarTintColor:(UIColor *)color;

- (CGFloat)wr_navBarBackgroundAlpha;
- (void)wr_setNavBarBackgroundAlpha:(CGFloat)alpha;

- (UIColor *)wr_navBarTintColor;
- (void)wr_setNavBarTintColor:(UIColor *)color;

- (UIColor *)wr_navBarTitleColor;
- (void)wr_setNavBarTitleColor:(UIColor *)color;

- (UIStatusBarStyle)wr_statusBarStyle;
- (void)wr_setStatusBarStyle:(UIStatusBarStyle)style;

- (void)wr_setCustomNavBar:(UINavigationBar *)navBar;

@end






