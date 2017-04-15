//
//  FourthViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/12.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "FourthViewController.h"
#import "UINavigationBar+WRAddition.h"
#import "AppDelegate.h"

// 为什么是 -128 ？
// 要保证在图片底部到导航栏底部的时候，导航栏已经由完全透明变成不透明，又因为这个透明度变化过程需要64px的距离(底数是64)，所以 NAVBAR_COLORCHANGE_POINT = 128，但是offsetY初始值就是-200，图片高度是200，所以此时 NAVBAR_COLORCHANGE_POINT = -200 + （200 - 128）
#define NAVBAR_COLORCHANGE_POINT -128
#define IMAGE_HEIGHT 200
#define SCROLL_DOWN_LIMIT 100
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface FourthViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation FourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"qq应用";
    self.tableView.contentInset = UIEdgeInsetsMake(self.imgView.bounds.size.height-64, 0, 0, 0);
    [self.tableView addSubview:self.imgView];
    [self.view addSubview:self.tableView];
    // 设置状态栏为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    // 设置导航栏颜色
    [self.navigationController.navigationBar wr_setBackgroundColor:[UIColor clearColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar wr_setBackgroundColor:[UIColor clearColor]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 如果不取消代理的话，跳转到下一个页面后，还会调用 scrollViewDidScroll 方法
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar wr_clear];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / 64;
        [self.navigationController.navigationBar wr_setBackgroundColor:[MainNavBarColor colorWithAlphaComponent:alpha]];
    }
    else
    {
        [self.navigationController.navigationBar wr_setBackgroundColor:[UIColor clearColor]];
    }
    
    //限制下拉的距离
    if(offsetY < (-IMAGE_HEIGHT - SCROLL_DOWN_LIMIT) && scrollView.isDragging) {
        [scrollView setContentOffset:CGPointMake(0, -IMAGE_HEIGHT - SCROLL_DOWN_LIMIT)];
        return;
    }
    
    CGRect frame = self.imgView.frame;
    self.imgView.frame = CGRectMake(0, offsetY, frame.size.width, -offsetY);
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
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    NSString *str = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    vc.title = str;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -IMAGE_HEIGHT, kScreenWidth, IMAGE_HEIGHT)];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.clipsToBounds = YES;
        _imgView.image = [UIImage imageNamed:@"image3"];
    }
    return _imgView;
}

@end
