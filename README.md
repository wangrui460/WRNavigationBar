![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/WRNavigationBar.png)

[Swift 版本：https://github.com/wangrui460/WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift)

实现过程请查看简书[http://www.jianshu.com/p/7e92451ab0b2]

------------------------------------------------------------

## 0️⃣. Demo 

![新浪微博个人中心](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/新浪微博个人中心.gif)

![qq空间](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/qq空间.gif)

![知乎日报](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/知乎日报.gif)

![QQ我的资料页](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/QQ我的资料页.gif)

![蚂蚁森林](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/蚂蚁森林.gif)

![自定义导航栏](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/自定义导航栏.gif)

![移动导航栏](https://github.com/wangrui460/WRNavigationBar_swift/raw/master/screenshots/移动导航栏.gif)


## 1️⃣. Installation 安装

> **手动拖入**
> 将 WRNavigationBar 文件夹拽入项目中，导入头文件：#import "WRNavigationBar.h"

## 2️⃣. How To Use 使用

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


## 3️⃣. More 更多 

If you find a bug, please create a issue.  
Welcome to pull requests.  
More infomation please view code.  
如果你发现了bug，请提一个issue。  
欢迎给我提pull requests。  
更多信息详见代码，也可查看我的简书: [我的简书](http://www.jianshu.com/p/540a7e6f7b40)

## 4️⃣. Update 最近更新 

- **2017.05.12**
解决问题：侧滑一点松开透明的导航栏会变不透明

- **2017.05.16**
新增Demo：完成自定义导航栏实现透明渐变等效果

- **2017.06.04**
新增Demo：大半夜的开了一个新的分支extern，为了翻译一下swift版本，因为当前swift版本功能已经很全面了，只是一直没时间写oc，最近又有新的需求！

- **2017.06.15**
解决问题：解决scrollView正在滑动的时候，点击返回按钮，导航栏颜色变化突兀的问题

## 5️⃣. 待完成功能


## 6️⃣. 期待

如果在使用过程中遇到BUG，或发现功能不够用，希望你能Issues我，或者加我的qq：1204607318
### 你觉得对你有所帮助的话，请献上宝贵的Star！！！ 不胜感激！！！
