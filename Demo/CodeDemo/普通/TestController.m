//
//  TestController.m
//  CodeDemo
//
//  Created by itwangrui on 2018/1/19.
//  Copyright © 2018年 wangrui. All rights reserved.
//

#import "TestController.h"

@interface TestController ()

@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 500, 290, 30)];
    tf.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    tf.placeholder = @"测试 IQKeyboardManager 导致的问题";
    [self.view addSubview:tf];
}

@end
