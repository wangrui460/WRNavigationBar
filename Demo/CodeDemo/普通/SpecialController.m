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
    button.frame = CGRectMake(100, 200, 150, 50);
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *chooseButton = [UIButton new];
    chooseButton.backgroundColor = [UIColor orangeColor];
    [chooseButton setTitle:@"选择照片" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    chooseButton.frame = CGRectMake(100, 280, 150, 50);
    [chooseButton addTarget:self action:@selector(onClickChoosePhotoButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseButton];
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
