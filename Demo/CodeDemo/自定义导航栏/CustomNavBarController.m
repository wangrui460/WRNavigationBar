//
//  FirstViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "CustomNavBarController.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 260
#define NAV_HEIGHT 64

@interface CustomNavBarController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation CustomNavBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.topView addSubview:self.imgView];
    self.imgView.center = self.topView.center;
    self.tableView.tableHeaderView = self.topView;
    [self.view insertSubview:self.navBar aboveSubview:self.tableView];

    self.navItem.title = @"个人中心";
    
    /// 注意查看 BaseViewController.m文件
    
    // 设置导航栏颜色
    [self wr_setNavBarBarTintColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
    
    // 设置导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    // 设置导航栏按钮颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    
    // 设置标题文字颜色
    [self wr_setNavBarTitleColor:[UIColor whiteColor]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self wr_setNavBarBackgroundAlpha:alpha];
        [self wr_setNavBarTintColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        [self wr_setNavBarTitleColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
    }
    else
    {
        [self wr_setNavBarBackgroundAlpha:0];
        [self wr_setNavBarTintColor:[UIColor whiteColor]];
        [self wr_setNavBarTitleColor:[UIColor whiteColor]];
        [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}


#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseViewController *vc = [BaseViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    NSString *str = [NSString stringWithFormat:@"右划返回查看效果 %zd",indexPath.row];
    vc.navItem.title = str;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.bounds.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)topView
{
    if (_topView == nil) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, IMAGE_HEIGHT)];
        _topView.backgroundColor = [UIColor orangeColor];
    }
    return _topView;
}

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image4"]];
        _imgView.bounds = CGRectMake(0, 0, 100, 100);
        _imgView.layer.cornerRadius = 50;
        _imgView.layer.masksToBounds = YES;
    }
    return _imgView;
}

@end
