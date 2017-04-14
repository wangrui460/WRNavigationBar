//
//  TempViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/13.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "TempViewController.h"
#import "UINavigationBar+WRAddition.h"
#import "UIViewController+BackButtonHandler.h"
#import "AppDelegate.h"

@interface TempViewController () <UIGestureRecognizerDelegate>

@end

@implementation TempViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)navigationShouldPopOnBackButton
{
//    if (要弹出提示) {
//        // 在这里创建UIAlertController等方法
//        return NO;
//    }
    return YES;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

@end
