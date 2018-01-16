//
//  WeiBoMineController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "AllTransparent.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 220
#define NAV_HEIGHT 64

@interface AllTransparent () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *topView;
@end

@implementation AllTransparent

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"wangrui460";
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.topView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"··· " style:UIBarButtonItemStyleDone target:self action:nil];
    
    // 设置导航栏颜色
    [self wr_setNavBarBarTintColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
    
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor greenColor]];
    [self wr_setNavBarTitleColor:[UIColor yellowColor]];
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
        [self wr_setNavBarTintColor:[UIColor greenColor]];
        [self wr_setNavBarTitleColor:[UIColor yellowColor]];
        [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}


#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
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
    AllTransparent *allTransparent = [AllTransparent new];
    [self.navigationController pushViewController:allTransparent animated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(-[self navBarBottom], 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)topView
{
    if (_topView == nil) {
        _topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wbBG"]];
        _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, IMAGE_HEIGHT);
    }
    return _topView;
}

- (int)navBarBottom
{
    if ([WRNavigationBar isIphoneX]) {
        return 88;
    } else {
        return 64;
    }
}

@end
