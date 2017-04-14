//
//  AppDelegate.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoListController.h"
#import "SixthViewController.h"

UIColor *MainNavBarColor = nil;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[DemoListController new]];
    UINavigationController *sixNav = [[UINavigationController alloc] initWithRootViewController:[SixthViewController new]];
    sixNav.title = @"没有系统返回按钮的情况";
    UITabBarController *tabBarVC = [UITabBarController new];
    tabBarVC.viewControllers = @[nav,sixNav];
    
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    
    [self setNavBarAppearence];
    return YES;
}

- (void)setNavBarAppearence
{
    MainNavBarColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor whiteColor]];
    [navBar setBarTintColor:MainNavBarColor];
    [navBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
}


@end
