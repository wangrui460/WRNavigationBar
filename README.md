![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/WRNavigationBar.png)

[For Swift：https://github.com/wangrui460/WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift)


------------------------------------------------------------

## Requirements
- iOS 8+
- Xcode 8+


## Demo 

![新浪微博个人中心](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/新浪微博个人中心.gif)

![qq空间](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/qq空间.gif)

![知乎日报](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/知乎日报.gif)

![QQ我的资料页](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/QQ我的资料页.gif)

![蚂蚁森林](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/蚂蚁森林.gif)

![自定义导航栏](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/自定义导航栏.gif)

![移动导航栏](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/移动导航栏.gif)


## Installation 

> **手动拖入**
> 将 WRNavigationBar 文件夹拽入项目中，导入头文件：#import "WRNavigationBar.h"

## Use

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
</code></pre>


## More
我的简书: [韦德460](http://www.jianshu.com/p/7e92451ab0b2)


## Update

- **2017.05.12**
解决问题：侧滑一点松开透明的导航栏会变不透明

- **2017.05.16**
新增Demo：完成自定义导航栏实现透明渐变等效果

- **2017.06.04**
新增Demo：大半夜的开了一个新的分支extern，为了翻译一下swift版本，因为当前swift版本功能已经很全面了，只是一直没时间写oc，最近又有新的需求！

- **2017.06.15**
解决问题：解决scrollView正在滑动的时候，点击返回按钮，导航栏颜色变化突兀的问题

- **2017.06.19**
解决问题：解决移动导航栏后右滑返回中途取消的bug


## Features


# Contact me
- Weibo: [@wangrui460](http://weibo.com/u/5145779726?is_all=1)
- Email:  wangruidev@gmail.com
- QQ：1204607318

# License

WRNavigationBar is available under the MIT license. See the LICENSE file for more info.

