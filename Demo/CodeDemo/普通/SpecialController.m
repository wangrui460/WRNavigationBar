//
//  SpecialController.m
//  CodeDemo
//
//  Created by itwangrui on 2017/12/10.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "SpecialController.h"
#import "AntForestController.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import "WRNavigationBar.h"

@interface SpecialController ()
@end

@implementation SpecialController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"不影响系统或者第三方";
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor greenColor]};
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    
    UIButton *button = [UIButton new];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"别点我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 150, 150, 50);
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *chooseButton = [UIButton new];
    chooseButton.backgroundColor = [UIColor orangeColor];
    [chooseButton setTitle:@"选择照片（TZImagePickerController）" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    chooseButton.frame = CGRectMake(10, 220, 350, 50);
    [chooseButton addTarget:self action:@selector(onClickChoosePhotoButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseButton];
    
    
    InnerController *innerVC = [InnerController new];
    innerVC.view.frame = CGRectMake(0, 300, [WRNavigationBar screenWidth], 300);
    [self addChildViewController:innerVC];
    [self.view addSubview:innerVC.view];
}

- (void)onClickButton {
    AntForestController *antForestVC = [AntForestController new];
    [self.navigationController pushViewController:antForestVC animated:YES];
}

- (void)onClickChoosePhotoButton {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:nil];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

@end





@implementation InnerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:134/255.0 green:188/255.0 blue:143/255.0 alpha:1.0];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [WRNavigationBar screenWidth], 100)];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.text = @"这是一个内部控制器";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

@end
