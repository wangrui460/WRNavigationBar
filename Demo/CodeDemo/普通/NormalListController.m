//
//  NormalListController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "NormalListController.h"
#import "WeiBoMineController.h"
#import "QQAppController.h"
#import "QQZoneController.h"
#import "ZhiHuController.h"
#import "QQMineController.h"
#import "AntForestController.h"
#import "AllTransparent.h"
#import "LaGouController.h"
#import "SpecialController.h"
#import "WRNavigationBar.h"
#import "TestController.h"

@interface NormalListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation NormalListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"常用";
    [self.view addSubview:self.tableView];
    
    
    // [self wr_setNavBarBarTintColor:[UIColor redColor]];
    // [self wr_setNavBarBackgroundAlpha:0];
    // 改变标题文字大小
    // self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:22]};
}

#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = nil;
    switch (indexPath.row) {
        case 0:
            str = @"新浪微博个人中心";
            break;
        case 1:
            str = @"类似qq应用空间效果";
            break;
        case 2:
            str = @"类似QQ空间效果";
            break;
        case 3:
            str = @"知乎日报";
            break;
        case 4:
            str = @"QQ我的资料页";
            break;
        case 5:
            str = @"蚂蚁森林";
            break;
        case 6:
            str = @"连续多个界面隐藏导航栏";
            break;
        case 7:
            str = @"拉钩App首页";
            break;
        case 8:
            str = @"WRNavigationBar 对其不产生任何印象";
            break;
        case 9:
            str = @"测试 IQKeyBoardManager 对其影响";
            break;
            
        default:
            break;
    }
    cell.textLabel.text = str;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            WeiBoMineController *weiBoMineVC = [WeiBoMineController new];
            [self.navigationController pushViewController:weiBoMineVC animated:YES];
        }
            break;
        case 1:
        {
            QQAppController *qqAppVC = [QQAppController new];
            [self.navigationController pushViewController:qqAppVC animated:YES];
        }
            break;
        case 2:
        {
            QQZoneController *qqZoneVC = [QQZoneController new];
            [self.navigationController pushViewController:qqZoneVC animated:YES];
        }
            break;
        case 3:
        {
            ZhiHuController *zhiHuVC = [ZhiHuController new];
            [self.navigationController pushViewController:zhiHuVC animated:YES];
        }
            break;
        case 4:
        {
            QQMineController *qqMineVC = [QQMineController new];
            [self.navigationController pushViewController:qqMineVC animated:YES];
        }
            break;
        case 5:
        {
            AntForestController *antForestVC = [AntForestController new];
            [self.navigationController pushViewController:antForestVC animated:YES];
        }
            break;
        case 6:
        {
            AllTransparent *antForestVC = [AllTransparent new];
            [self.navigationController pushViewController:antForestVC animated:YES];
        }
            break;
        case 7:
        {
            LaGouController *laGouVC = [LaGouController new];
            [self.navigationController pushViewController:laGouVC animated:YES];
        }
            break;
        case 8:
        {
            SpecialController *specialVC = [SpecialController new];
            [self.navigationController pushViewController:specialVC animated:YES];
        }
            break;
        case 9:
        {
            TestController *testVC = [TestController new];
            [self.navigationController pushViewController:testVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-0-49);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
