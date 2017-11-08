![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/WRNavigationBar.png)

<p align="center">
<a href="https://github.com/wangrui460/WRNavigationBar"><img src="https://img.shields.io/badge/platform-iOS%208.0%2B-ff69b5152950834.svg"></a>
<a href="https://github.com/wangrui460/WRNavigationBar"><img src="https://img.shields.io/cocoapods/v/WRNavigationBar.svg?style=flat"></a>
<a href="https://github.com/wangrui460/WRNavigationBar_swift"><img src="https://img.shields.io/badge/Swift-compatible-orange.svg"></a>
<a href="https://github.com/wangrui460/WRNavigationBar/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg?style=flat"></a>
</p>
<p align="center">
<a href="https://twitter.com/wangrui460"><img src="https://img.shields.io/twitter/url/http/shields.io.svg?style=social&maxAge=2592000"></a>
<a href="http://weibo.com/wangrui460"><img src="http://i67.tinypic.com/wbulbr.jpg"></a>
</p>

[For Swift：https://github.com/wangrui460/WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift)


------------------------------------------------------------

## Requirements
- iOS 8+
- Xcode 8+


## Demo
![拉钩App首页](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/拉钩App首页.gif)

![导航栏显示渐变色](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/导航栏显示渐变色.gif)

![导航栏显示图片](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/导航栏显示图片.gif)

![新浪微博个人中心](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/新浪微博个人中心.gif)

![qq空间](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/qq空间.gif)

![知乎日报](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/知乎日报.gif)

![QQ我的资料页](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/QQ我的资料页.gif)

![蚂蚁森林](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/蚂蚁森林.gif)

![连续多个界面导航栏透明](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/连续多个界面导航栏透明.gif)

![自定义导航栏](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/自定义导航栏.gif)

![移动导航栏](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/移动导航栏.gif)


## Installation
> **CocoaPods**
> pod 'WRNavigationBar','~>1.0.2'
如果未发现 1.0.2 请更新一下pod


> **手动拖入**
> 将 WRNavigationBar 文件夹拽入项目中，导入头文件：#import "WRNavigationBar.h"，自定义导航栏需要导入 "WRCustomNavigationBar.h"

## Use （以下方式不再适用自定义导航栏，自定义导航栏的使用方式请查看Demo）
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
[UIColor wr_setDefaultNavBarBarTintColor:MainNavBarColor];
// 设置导航栏所有按钮的默认颜色
[UIColor wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
// 设置导航栏标题默认颜色
[UIColor wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
// 统一设置状态栏样式
[UIColor wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
// 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
[UIColor wr_setDefaultNavBarShadowImageHidden:YES];
</code></pre>


## More
我的简书: [韦德460](http://www.jianshu.com/p/7e92451ab0b2)


## Update
- **2017.11.8**
解决问题：解决取消返回手势导航栏变不透明度的问题、解决滑动改变标题颜色导航栏闪一下的问题

- **2017.10.29**
解决问题：简单适配 iOS11、iPhone X（自定义导航栏 new UINavigationBar 的方式已经不能使用了，所以简单写了一个WRCustomNavigationBar，功能简单，后续会增加更多功能。如果有更好的方式来自定义导航栏，希望大神们教教我）

- **2017.07.26**
添加新Demo：拉钩App首页带搜索框的透明导航栏

- **2017.07.22**
添加新Demo：连续多个界面导航栏透明

- **2017.07.09**
解决问题：当一个控制器中包含多个控制器时，导航栏颜色或透明度不正常的问题

- **2017.07.05**
添加新功能：全局设置导航栏显示图片(不建议在非自定义导航栏中使用)

- **2017.07.02**
添加新功能：导航栏可显示图片

- **2017.06.29**
添加新功能：可单独设置每个控制器对应导航栏底部分割线是否隐藏

- **2017.06.29**
解决问题：解决引入WRNavigationBar后，无法设置导航栏标题大小的问题

- **2017.06.19**
解决问题：解决移动导航栏后右滑返回中途取消导致的导航栏错位的问题

- **2017.06.15**
解决问题：解决scrollView正在滑动的时候，点击返回按钮，导航栏颜色变化突兀的问题

- **2017.06.04**
新增Demo：大半夜的开了一个新的分支extern，为了翻译一下swift版本，因为当前swift版本功能已经很全面了，只是一直没时间写oc，最近又有新的需求！

- **2017.05.16**
新增Demo：完成自定义导航栏实现透明渐变等效果

- **2017.05.12**
解决问题：侧滑一点松开透明的导航栏会变不透明


## Features

# Contact me
- Weibo: [@wangrui460](http://weibo.com/wangrui460)
- Email:  wangruidev@gmail.com
- QQ：1204607318

# License
WRNavigationBar is available under the MIT license. See the LICENSE file for more info.


