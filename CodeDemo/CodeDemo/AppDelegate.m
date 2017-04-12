//
//  AppDelegate.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

UIColor *MainNavBarColor = nil;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBarVC = [UITabBarController new];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:[FirstViewController new]];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:[ThirdViewController new]];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:[FourthViewController new]];
    tabBarVC.viewControllers = @[firstNav, secondNav, thirdNav, fourthNav];
    
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
    navBar.translucent = NO;
    [navBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


@end
