//
//  SecondViewController.m
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/10.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "SecondViewController.h"
#import "UINavigationBar+WRAddition.h"
#import "AppDelegate.h"

// offsetY > 60 的时候导航栏开始偏移
#define NAVBAR_TRANSLATION_POINT 60

@interface SecondViewController ()
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar wr_setBackgroundColor:MainNavBarColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar wr_clear];
}

// 改变导航栏颜色对应的透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    // 除数表示 -> 导航栏从完全不透明到完全透明的过渡距离
    CGFloat alpha = 1 - (offsetY - NAVBAR_TRANSLATION_POINT) / 64;
    
    if (offsetY > NAVBAR_TRANSLATION_POINT) {
        CGFloat translationY = offsetY - NAVBAR_TRANSLATION_POINT;
        translationY = (translationY > 44) ? 44 : translationY;
        [self.navigationController.navigationBar wr_setTranslationY:-translationY];
        [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:alpha];
    }
}





#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [UIViewController new];
    vc.title = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
