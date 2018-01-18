//
//  WRCustomNavigationBar.h
//  CodeDemo
//
//  Created by wangrui on 2017/10/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import <UIKit/UIKit.h>

@interface WRCustomNavigationBar : UIView

@property (nonatomic, copy) void(^onClickLeftButton)(void);
@property (nonatomic, copy) void(^onClickRightButton)(void);

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UIColor  *titleLabelColor;
@property (nonatomic, strong) UIFont   *titleLabelFont;
@property (nonatomic, strong) UIColor  *barBackgroundColor;
@property (nonatomic, strong) UIImage  *barBackgroundImage;

+ (instancetype)CustomNavigationBar;

- (void)wr_setBottomLineHidden:(BOOL)hidden;
- (void)wr_setBackgroundAlpha:(CGFloat)alpha;
- (void)wr_setTintColor:(UIColor *)color;

// 默认返回事件
//- (void)wr_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor;
//- (void)wr_setLeftButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
- (void)wr_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)wr_setLeftButtonWithImage:(UIImage *)image;
- (void)wr_setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

//- (void)wr_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor;
//- (void)wr_setRightButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
- (void)wr_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)wr_setRightButtonWithImage:(UIImage *)image;
- (void)wr_setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;



@end













