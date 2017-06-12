//
//  QQMineController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "QQMineController.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 280
#define NAV_HEIGHT 64

@interface QQMineController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *bottomImgView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation QQMineController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.view addSubview:self.bottomImgView];
    [self.view addSubview:self.tableView];
    [self.topView addSubview:self.imgView];
    self.imgView.center = CGPointMake(self.topView.center.x, self.topView.center.y - 20);
    [self.topView addSubview:self.nameLabel];
    self.nameLabel.frame = CGRectMake(0, self.imgView.frame.size.height + self.imgView.frame.origin.y + 10, self.view.frame.size.width, 25);
    self.tableView.tableHeaderView = self.topView;
    
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        [self changeNavBarAnimateWithIsClear:NO];
        self.title = @"wangrui460";
    }
    else
    {
        [self changeNavBarAnimateWithIsClear:YES];
        self.title = @"";
    }
}

- (void)changeNavBarAnimateWithIsClear:(BOOL)isClear
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 animations:^
     {
         __strong typeof(self) pThis = weakSelf;
         if (isClear == YES) {
             [pThis wr_setNavBarBackgroundAlpha:0];
         } else {
             [pThis wr_setNavBarBackgroundAlpha:1.0];
         }
     }];
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
    cell.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    cell.textLabel.text = str;
    cell.textLabel.textColor = [UIColor whiteColor];
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
    vc.view.backgroundColor = MainViewColor;
    NSString *str = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    vc.title = str;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)topView
{
    if (_topView == nil) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, IMAGE_HEIGHT)];
        _topView.backgroundColor = [UIColor clearColor];
    }
    return _topView;
}

- (UIImageView *)bottomImgView
{
    if (_bottomImgView == nil) {
        _bottomImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomImage"]];
        _bottomImgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    return _bottomImgView;
}

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image4"]];
        _imgView.bounds = CGRectMake(0, 0, 90, 90);
        _imgView.layer.borderColor = [UIColor whiteColor].CGColor;
        _imgView.layer.borderWidth = 2;
        _imgView.layer.cornerRadius = 45;
        _imgView.layer.masksToBounds = YES;
    }
    return _imgView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [UILabel new];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"wangrui460";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _nameLabel;
}

@end
