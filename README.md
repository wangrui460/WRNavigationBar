![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/WRNavigationBar.png)

<p align="center">
<a href="https://github.com/wangrui460/WRNavigationBar"><img src="https://img.shields.io/badge/platform-iOS%208.0%2B-ff69b5152950834.svg"></a>
<a href="https://github.com/wangrui460/WRNavigationBar"><img src="https://img.shields.io/cocoapods/v/WRNavigationBar.svg?style=flat"></a>
<a href="https://github.com/wangrui460/WRNavigationBar_swift"><img src="https://img.shields.io/badge/Swift-compatible-orange.svg"></a>
<a href="https://github.com/wangrui460/WRNavigationBar/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg?style=flat"></a>

------------------------------------------------------------

# iOS 技术交流
我创建了一个 微信 iOS 技术交流群，欢迎小伙伴们加入一起交流学习~
	
可以加我微信我拉你进去（备注iOS），我的微信号 wr1204607318
	
## Requirements
- iOS 7.0+
- Xcode 8+

## Demo
|拉钩App首页|新浪微博个人中心|qq空间|知乎日报|
|:-:|:-:|:-:|:-:|
|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/拉钩App首页.gif)|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/新浪微博个人中心.gif)|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/qq空间.gif)|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/知乎日报.gif)|

|QQ我的资料页|蚂蚁森林|连续多个界面导航栏透明|移动导航栏|
|:-:|:-:|:-:|:-:|
|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/QQ我的资料页.gif)|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/蚂蚁森林.gif)|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/连续多个界面导航栏透明.gif)|![](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/移动导航栏.gif)|

## Installation
> **CocoaPods**
> pod 'WRNavigationBar','~>1.3.0’
如果未发现 1.3.0 请更新一下pod

> **手动拖入**
> 将 WRNavigationBar 文件夹拽入项目中，导入头文件：#import "WRNavigationBar.h"

### Use
✨✨ 一定要看 Demo 中的 AppDelegate 文件 ✨✨

<pre><code>
// 设置是 全局使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是全局使用 （局部使用待开发）
[WRNavigationBar wr_widely];
// WRNavigationBar 不会对 blackList 中的控制器有影响
[WRNavigationBar wr_setBlacklist:@[@"SpecialController",
				 @"TZPhotoPickerController",
				 @"TZGifPhotoPreviewController",
				 @"TZAlbumPickerController",
				 @"TZPhotoPreviewController",
				 @"TZVideoPlayerController"]];
</code></pre>

<pre><code>
// 一行代码搞定导航栏颜色
[self wr_setNavBarBarTintColor:[UIColor whiteColor]];
// 一行代码搞定导航栏透明度
[self wr_setNavBarBackgroundAlpha:alpha];
// 一行代码搞定导航栏两边按钮颜色
[self wr_setNavBarTintColor:[UIColor whiteColor]];
// 一行代码搞定导航栏上标题颜色
[self wr_setNavBarTitleColor:[UIColor whiteColor]];
// 一行代码搞定状态栏是 default 还是 lightContent
[self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
// 一行代码搞定导航栏底部分割线是否隐藏
[self wr_setNavBarShadowImageHidden:YES];
</code></pre>

<pre><code>
// 设置导航栏默认的背景颜色
[WRNavigationBar wr_setDefaultNavBarBarTintColor:MainNavBarColor];
// 设置导航栏所有按钮的默认颜色
[WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
// 设置导航栏标题默认颜色
[WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
// 统一设置状态栏样式
[WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
// 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
[WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
</code></pre>

## More
扫码回复1获取面试资料（持续更新）
![](https://user-images.githubusercontent.com/11909313/123933944-6a4abe00-d9c5-11eb-83ca-379313a2af7c.png)

# License
WRNavigationBar is available under the MIT license. See the LICENSE file for more info.
