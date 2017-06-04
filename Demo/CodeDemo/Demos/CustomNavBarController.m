//
//  FirstViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "CustomNavBarController.h"
#import "UINavigationBar+WRAddition.h"
#import "AppDelegate.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 260
#define NAV_HEIGHT 64

@interface CustomNavBarController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation CustomNavBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.imgView;
    [self.view insertSubview:self.navBar aboveSubview:self.tableView];
    // 设置状态栏为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    // 设置导航栏颜色
    [self.navBar wr_setBackgroundColor:[UIColor clearColor]];
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"star" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navItem.title = @"自定义导航栏";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // 如果不取消代理的话，跳转到下一个页面后，还会调用 scrollViewDidScroll 方法
    self.tableView.delegate = nil;
    [self.navBar wr_clear];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self.navBar wr_setBackgroundColor:[MainNavBarColor colorWithAlphaComponent:alpha]];
    }
    else
    {
        [self.navBar wr_setBackgroundColor:[UIColor clearColor]];
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
    NSString *str = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    vc.navItem.title = str;
    vc.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.bounds.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
        _imgView.frame = CGRectMake(0, 0, self.view.bounds.size.width, IMAGE_HEIGHT);
    }
    return _imgView;
}

@end
