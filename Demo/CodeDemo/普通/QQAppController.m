//
//  QQAppController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/12.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "QQAppController.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"

#define NAVBAR_COLORCHANGE_POINT -80
#define IMAGE_HEIGHT 260
#define SCROLL_DOWN_LIMIT 100
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

@interface QQAppController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation QQAppController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"qq应用";
    
    self.tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT-64, 0, 0, 0);
    [self.tableView addSubview:self.imgView];
    [self.view addSubview:self.tableView];
    [self wr_setNavBarBackgroundAlpha:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        [self changeNavBarAnimateWithIsClear:NO];
    }
    else
    {
        [self changeNavBarAnimateWithIsClear:YES];
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
        self.imgView.frame = CGRectMake(0, newOffsetY, kScreenWidth, -newOffsetY);
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

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -IMAGE_HEIGHT, kScreenWidth, IMAGE_HEIGHT)];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.clipsToBounds = YES;
        _imgView.image = [self imageWithImageSimple:[UIImage imageNamed:@"image3"] scaledToSize:CGSizeMake(kScreenWidth, IMAGE_HEIGHT+SCROLL_DOWN_LIMIT)];
    }
    return _imgView;
}

- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width*2, newSize.height*2));
    [image drawInRect:CGRectMake (0, 0, newSize.width*2, newSize.height*2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
