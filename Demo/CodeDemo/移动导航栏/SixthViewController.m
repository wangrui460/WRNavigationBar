//
//  SixthViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "SixthViewController.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"

// offsetY > -64 的时候导航栏开始偏移
#define NAVBAR_TRANSLATION_POINT 0
#define NavBarHeight 44

@interface SixthViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation SixthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"看83行代码";
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.imgView;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"自定义返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self setNavigationBarTransformProgress:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    // 向上滑动的距离
    CGFloat scrollUpHeight = offsetY - NAVBAR_TRANSLATION_POINT;
    // 除数表示 -> 导航栏从完全不透明到完全透明的过渡距离
    CGFloat progress = scrollUpHeight / NavBarHeight;
    if (offsetY > NAVBAR_TRANSLATION_POINT)
    {
        if (scrollUpHeight > 44)
        {
            [self setNavigationBarTransformProgress:1];
        }
        else
        {
            [self setNavigationBarTransformProgress: progress];
        }
    }
    else
    {
        [self setNavigationBarTransformProgress:0];
    }
}

- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar wr_setTranslationY:(-NavBarHeight * progress)];
    // 没有系统返回按钮，所以 hasSystemBackIndicator = NO
    // 如果这里不设置为NO，你会发现，导航栏无缘无故多出来一个返回按钮
    [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:(1 - progress) hasSystemBackIndicator:NO];
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
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    }
    return _imgView;
}

@end
