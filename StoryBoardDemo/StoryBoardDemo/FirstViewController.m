//
//  FirstViewController.m
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "FirstViewController.h"
#import "UINavigationBar+WRAddition.h"
#import "AppDelegate.h"

// offsetY > 60 的时候导航栏颜色透明度开始改变
#define NAVBARCOLOR_CHANGE_POINT 60

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar wr_setBackgroundColor:[UIColor clearColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
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
    // 除数表示 -> 导航栏从完全透明到完全不透明的过渡距离
    CGFloat alpha = (offsetY - NAVBARCOLOR_CHANGE_POINT) / 64;
    
//    //限制下拉的距离
//    if(offsetY < -150 && scrollView.isDragging) {
//        [scrollView setContentOffset:CGPointMake(0, -150)];
//    }
    
    if (offsetY > NAVBARCOLOR_CHANGE_POINT) {
        [self.navigationController.navigationBar wr_setBackgroundColor:[MainNavBarColor colorWithAlphaComponent:alpha]];
    }
    else
    {
        [self.navigationController.navigationBar wr_setBackgroundColor:[UIColor clearColor]];
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
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
