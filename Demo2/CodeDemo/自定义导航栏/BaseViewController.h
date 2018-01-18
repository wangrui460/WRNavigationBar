//
//  BaseViewController.h
//  CodeDemo
//
//  Created by wangrui on 2017/5/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import <UIKit/UIKit.h>
#import "WRCustomNavigationBar.h"

@interface BaseViewController : UIViewController
@property (nonatomic, strong) WRCustomNavigationBar *customNavBar;
@end
