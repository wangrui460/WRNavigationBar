//
//  DemoListController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "DemoListController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface DemoListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation DemoListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"DemoList";
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
            str = @"demo1";
            break;
        case 1:
            str = @"demo2";
            break;
        case 2:
            str = @"demo3";
            break;
        case 3:
            str = @"demo4";
            break;
        case 4:
            str = @"demo5";
            break;
            
        default:
            break;
    }
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
    switch (indexPath.row) {
        case 0:
        {
            FirstViewController *firstVC = [FirstViewController new];
            [self.navigationController pushViewController:firstVC animated:YES];
        }
            break;
        case 1:
        {
            SecondViewController *secondVC = [SecondViewController new];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
        case 2:
        {
            ThirdViewController *thirdVC = [ThirdViewController new];
            [self.navigationController pushViewController:thirdVC animated:YES];
        }
            break;
        case 3:
        {
            FourthViewController *fourthVC = [FourthViewController new];
            [self.navigationController pushViewController:fourthVC animated:YES];
        }
            break;
        case 4:
        {
            FifthViewController *fifthVC = [FifthViewController new];
            [self.navigationController pushViewController:fifthVC animated:YES];
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
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
