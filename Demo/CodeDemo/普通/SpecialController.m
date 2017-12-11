//
//  SpecialController.m
//  CodeDemo
//
//  Created by itwangrui on 2017/12/10.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "SpecialController.h"
#import "AntForestController.h"

@interface SpecialController ()
@end

@implementation SpecialController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"不影响系统或者第三方";
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    
    UIButton *button = [UIButton new];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"别点我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 150, 50);
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)onClickButton {
    AntForestController *antForestVC = [AntForestController new];
    [self.navigationController pushViewController:antForestVC animated:YES];
}

@end
