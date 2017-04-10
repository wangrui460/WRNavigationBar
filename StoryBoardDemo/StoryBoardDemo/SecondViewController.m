//
//  SecondViewController.m
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/10.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "SecondViewController.h"
#import "UINavigationBar+WRAddition.h"
#import "AppDelegate.h"

// offsetY > 60 的时候导航栏开始偏移
#define NAVBAR_TRANSLATION_POINT 0
#define NavBarHeight 44

@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.navigationController.navigationBar wr_setBackgroundColor:MainNavBarColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar wr_clear];
}

// 改变导航栏颜色对应的透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    // 除数表示 -> 导航栏从完全不透明到完全透明的过渡距离
    CGFloat progress = (offsetY - NAVBAR_TRANSLATION_POINT) / NavBarHeight;
    
    if (offsetY > NAVBAR_TRANSLATION_POINT)
    {
        if (offsetY - NAVBAR_TRANSLATION_POINT > 44) {
            [self setNavigationBarTransformProgress:1.0];
        }
        else {
            [self setNavigationBarTransformProgress:progress];
        }
    }
    else {
        [self setNavigationBarTransformProgress:0];
        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }
}

- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar wr_setTranslationY:(-NavBarHeight * progress)];
    [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:(1 - progress)];
}



#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [UIViewController new];
    vc.title = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
