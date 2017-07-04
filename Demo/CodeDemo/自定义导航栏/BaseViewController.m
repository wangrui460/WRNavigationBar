//
//  BaseViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/5/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "WRNavigationBar.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupNavBar];
}

- (void)setupNavBar
{
    // 自定义导航栏必须设置这个属性!!!!!!!
    [self wr_setCustomNavBar:self.navBar];
    
    [self.view addSubview:self.navBar];
    self.navBar.items = @[self.navItem];
    
    // 设置自定义导航栏背景图片
    [self wr_setNavBarBackgroundImage:[UIImage imageNamed:@"millcolorGrad"]];
    
    // 设置自定义导航栏默认背景颜色
    // [self wr_setNavBarBarTintColor:MainNavBarColor];
    
    // 设置自定义导航栏标题颜色
    [self wr_setNavBarTitleColor:[UIColor whiteColor]];
    
    // 设置自定义导航栏左右按钮字体颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    
    if (self.navigationController.childViewControllers.count != 1) {
        self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<<" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UINavigationBar *)navBar
{
    if (_navBar == nil) {
        _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    }
    return _navBar;
}

- (UINavigationItem *)navItem
{
    if (_navItem == nil) {
        _navItem = [UINavigationItem new];
    }
    return _navItem;
}

@end
