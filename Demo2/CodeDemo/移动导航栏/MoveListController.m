//
//  MoveListController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "MoveListController.h"
#import "SecondViewController.h"
#import "SixthViewController.h"

@interface MoveListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MoveListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"移动导航栏";
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = nil;
    switch (indexPath.row) {
        case 0:
            str = @"超过临界点移动导航栏";
            break;
        case 1:
            str = @"没有系统返回按钮的情况";
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
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            SecondViewController *secondVC = [SecondViewController new];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
        case 1:
        {
            SixthViewController *sixVC = [SixthViewController new];
            [self.navigationController pushViewController:sixVC animated:YES];
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
        CGRect frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
