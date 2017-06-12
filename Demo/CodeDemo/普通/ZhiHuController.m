//
//  ZhiHuController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "ZhiHuController.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

#define NAVBAR_COLORCHANGE_POINT (-IMAGE_HEIGHT + NAV_HEIGHT*2)
#define NAV_HEIGHT 64
#define IMAGE_HEIGHT 260
#define SCROLL_DOWN_LIMIT 70
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

@interface ZhiHuController () <UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SDCycleScrollView *advView;
@end

@implementation ZhiHuController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"知乎日报";
    self.tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT-64, 0, 0, 0);
    [self.tableView addSubview:self.advView];
    [self.view addSubview:self.tableView];
    
    
    [self wr_setNavBarBackgroundAlpha:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self wr_setNavBarBackgroundAlpha:alpha];
    }
    else
    {
        [self wr_setNavBarBackgroundAlpha:0];
    }
    
    //限制下拉的距离
    if(offsetY < LIMIT_OFFSET_Y) {
        [scrollView setContentOffset:CGPointMake(0, LIMIT_OFFSET_Y)];
    }
    
    // 改变图片框的大小 (上滑的时候不改变)
    // 这里不能使用offsetY，因为当（offsetY < LIMIT_OFFSET_Y）的时候，y = LIMIT_OFFSET_Y 不等于 offsetY
    CGFloat newOffsetY = scrollView.contentOffset.y;
    if (newOffsetY < -IMAGE_HEIGHT)
    {
        self.advView.frame = CGRectMake(0, newOffsetY, kScreenWidth, -newOffsetY);
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
        CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width*2, newSize.height*2));
    [image drawInRect:CGRectMake (0, 0, newSize.width*2, newSize.height*2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (SDCycleScrollView *)advView
{
    if (_advView == nil) {
        NSArray *localImages = @[@"localImg6", @"localImg7", @"localImg8", @"localImg9", @"localImg10"];
        NSArray *descs = @[@"韩国防部回应停止部署萨德:遵照最高统帅指导方针",
                           @"勒索病毒攻击再次爆发 国内校园网大面积感染",
                           @"Win10秋季更新重磅功能：跟安卓与iOS无缝连接",
                           @"《琅琊榜2》为何没有胡歌？胡歌：我看过剧本，离开是种保护",
                           @"阿米尔汗在印度的影响力，我国的哪位影视明星能与之齐名呢？"];
        _advView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -IMAGE_HEIGHT, kScreenWidth, IMAGE_HEIGHT) imageNamesGroup:localImages];
        _advView.pageDotColor = [UIColor grayColor];
        _advView.currentPageDotColor = [UIColor orangeColor];
        _advView.titlesGroup = descs;
        _advView.titleLabelHeight = IMAGE_HEIGHT * 0.25;
        _advView.titleLabelTextColor = [UIColor whiteColor];
        _advView.titleLabelTextFont = [UIFont systemFontOfSize:18];
        _advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _advView;
}

@end
