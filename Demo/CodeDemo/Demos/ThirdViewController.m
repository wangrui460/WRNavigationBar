//
//  ThirdViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/12.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "ThirdViewController.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"

#define NavBarHeight 44

@interface ThirdViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, assign) CGFloat navbar_translation_point;
@property (nonatomic, assign) CGFloat lastOffsetY;
@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"WR";
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.imgView;
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
    [self.navigationController.navigationBar wr_setTranslationY:0];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self stopScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        [self stopScroll:scrollView];
    }
}

- (void)stopScroll:(UIScrollView*)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat scrollUpHeight = offsetY - self.navbar_translation_point;
    __weak typeof(self) weakSelf = self;
    if (scrollUpHeight >= 22)
    {
        [UIView animateWithDuration:0.3 animations:^{
            __strong typeof(self) pThis = weakSelf;
            [pThis setNavigationBarTransform:44];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            __strong typeof(self) pThis = weakSelf;
            [pThis setNavigationBarTransform:0];
        }];
    }
    self.navbar_translation_point = offsetY;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat isScrollup = (offsetY - self.lastOffsetY) > 0 ? YES : NO;
    CGFloat scrollUpHeight = (offsetY - self.navbar_translation_point) > 44 ? 44 : (offsetY - self.navbar_translation_point);
    CGFloat curTransformY = [self.navigationController.navigationBar wr_getTranslationY];
    
    if (isScrollup == YES)
    {
        if (curTransformY == -44) {
            return;
        }
        else
        {
            if (offsetY > 0) {
                [self setNavigationBarTransform:scrollUpHeight];
            }
        }
    }
    else
    {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            __strong typeof(self) pThis = weakSelf;
            [pThis setNavigationBarTransform:0];
        }];
    }
    
    self.lastOffsetY = offsetY;
}

- (void)setNavigationBarTransform:(CGFloat)scrollUpHeight
{
    [self.navigationController.navigationBar wr_setTranslationY:-scrollUpHeight];
    CGFloat curTransformY = [self.navigationController.navigationBar wr_getTranslationY];
    [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:(1 - (-curTransformY / 44.0)) hasSystemBackIndicator:true];
}

//- (void)setNavigationBarTransformProgress:(CGFloat)progress
//{
//    [self.navigationController.navigationBar wr_setTranslationY:(-NavBarHeight * progress)];
//    [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:(1 - progress) hasSystemBackIndicator:YES];
//}




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
    // 做成这种样式，最好不要有点击事件
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
