//
//  UINavigationBar+WRAddition.h
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import <UIKit/UIKit.h>
@class WRCustomNavigationBar;

@interface WRNavigationBar : UIView
+ (BOOL)isIphoneX;
+ (CGFloat)navBarBottom;
+ (CGFloat)tabBarHeight;
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
@end


#pragma mark - Default
@interface WRNavigationBar (WRDefault)

/// 局部使用该库       待开发
//+ (void)wr_local;
/// 广泛使用该库       default 暂时是默认， wr_local 完成后，wr_local就会变成默认
+ (void)wr_widely;

/// 局部使用该库时，设置需要用到的控制器      待开发
//+ (void)wr_setWhitelist:(NSArray<NSString *> *)list;
/// 广泛使用该库时，设置需要屏蔽的控制器
+ (void)wr_setBlacklist:(NSArray<NSString *> *)list;

/** set default barTintColor of UINavigationBar */
+ (void)wr_setDefaultNavBarBarTintColor:(UIColor *)color;

/** set default barBackgroundImage of UINavigationBar */
/** warning: wr_setDefaultNavBarBackgroundImage is deprecated! place use WRCustomNavigationBar */
//+ (void)wr_setDefaultNavBarBackgroundImage:(UIImage *)image;

/** set default tintColor of UINavigationBar */
+ (void)wr_setDefaultNavBarTintColor:(UIColor *)color;

/** set default titleColor of UINavigationBar */
+ (void)wr_setDefaultNavBarTitleColor:(UIColor *)color;

/** set default statusBarStyle of UIStatusBar */
+ (void)wr_setDefaultStatusBarStyle:(UIStatusBarStyle)style;

/** set default shadowImage isHidden of UINavigationBar */
+ (void)wr_setDefaultNavBarShadowImageHidden:(BOOL)hidden;

@end



#pragma mark - UINavigationBar
@interface UINavigationBar (WRAddition) <UINavigationBarDelegate>

/** 设置导航栏所有BarButtonItem的透明度 */
- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

/** 设置导航栏在垂直方向上平移多少距离 */
- (void)wr_setTranslationY:(CGFloat)translationY;

/** 获取当前导航栏在垂直方向上偏移了多少 */
- (CGFloat)wr_getTranslationY;

@end




#pragma mark - UIViewController
@interface UIViewController (WRAddition)

/** record current ViewController navigationBar backgroundImage */
/** warning: wr_setDefaultNavBarBackgroundImage is deprecated! place use WRCustomNavigationBar */
//- (void)wr_setNavBarBackgroundImage:(UIImage *)image;
- (UIImage *)wr_navBarBackgroundImage;

/** record current ViewController navigationBar barTintColor */
- (void)wr_setNavBarBarTintColor:(UIColor *)color;
- (UIColor *)wr_navBarBarTintColor;

/** record current ViewController navigationBar backgroundAlpha */
- (void)wr_setNavBarBackgroundAlpha:(CGFloat)alpha;
- (CGFloat)wr_navBarBackgroundAlpha;

/** record current ViewController navigationBar tintColor */
- (void)wr_setNavBarTintColor:(UIColor *)color;
- (UIColor *)wr_navBarTintColor;

/** record current ViewController titleColor */
- (void)wr_setNavBarTitleColor:(UIColor *)color;
- (UIColor *)wr_navBarTitleColor;

/** record current ViewController statusBarStyle */
- (void)wr_setStatusBarStyle:(UIStatusBarStyle)style;
- (UIStatusBarStyle)wr_statusBarStyle;

/** record current ViewController navigationBar shadowImage hidden */
- (void)wr_setNavBarShadowImageHidden:(BOOL)hidden;
- (BOOL)wr_navBarShadowImageHidden;

/** record current ViewController custom navigationBar */
/** warning: wr_setDefaultNavBarBackgroundImage is deprecated! place use WRCustomNavigationBar */
//- (void)wr_setCustomNavBar:(WRCustomNavigationBar *)navBar;

@end






