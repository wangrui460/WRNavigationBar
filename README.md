# WRNavigationBar  
[Swift 版本](https://github.com/wangrui460/WRNavigationBar_swift)

------------------------------------------------------------

## 0️⃣. Demo 
#### 基本.gif👇（可实现导航栏颜色渐变、透明）
![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/基本.gif)

#### 超过零界点移动导航栏.gif👇（超过零界点，以动画的方式移动导航栏位置只显示状态栏）
![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/超过零界点移动导航栏.gif)

#### 超过零界点多少，移动导航栏多少.gif👇（超过零界点多少，移动导航栏多少，直到只显示状态栏为止，也可不显示状态栏）
![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/超过零界点多少，移动导航栏多少.gif)

#### 类似QQ应用空间效果.gif👇（超过零界点，就以动画的方法设置导航栏透明或不透明，并且限制下拉距离，且下拉不会看到图片框后面的背景）
![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/类似QQ应用空间效果.gif)

#### 类似QQ空间效果.gif👇（和上一个例子的区别在于超过零界点多少，导航栏和导航栏上的元素的透明度对应多少）
![image](https://github.com/wangrui460/WRNavigationBar/raw/master/screenshots/类似QQ空间效果.gif)

## 1️⃣. Installation 安装

> **手动拖入**
> 将 WRNavigationBar 文件夹拽入项目中，导入头文件：#import "UINavigationBar+WRAddition.h"

## 2️⃣. How To Use 使用

**1. 对外提供的四个接口**
<pre><code>
/** 设置导航栏背景颜色*/
- (void)wr_setBackgroundColor:(UIColor *)color;

/** 设置导航栏所有BarButtonItem的透明度，如果界面的返回按钮是系统的，那么这里的参数hasSystemBackIndicator就要设置成YES */
- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

/** 设置导航栏在垂直方向上平移多少距离 */
- (void)wr_setTranslationY:(CGFloat)translationY;

/** 清除在导航栏上设置的背景颜色、透明度、位移距离等属性 */
- (void)wr_clear;
</code></pre>

**2. 举例说明**
<pre><code>
// 设置导航栏透明
[self.navigationController.navigationBar wr_setBackgroundColor:[UIColor clearColor]];

// 设置导航栏颜色为MainNavBarColor，透明度为alpha
[self.navigationController.navigationBar wr_setBackgroundColor:[MainNavBarColor colorWithAlphaComponent:alpha]];

// 设置导航栏上所有元素的透明度，如果用的是系统的返回按钮，hasSystemBackIndicator = YES，否则为NO
[self.navigationController.navigationBar wr_setBarButtonItemsAlpha:(1 - progress) hasSystemBackIndicator:YES];

// 清除导航栏所有相关设置
[self.navigationController.navigationBar wr_clear];
</code></pre>


## 3️⃣. More 更多 

If you find a bug, please create a issue.  
Welcome to pull requests.  
More infomation please view code.  
如果你发现了bug，请提一个issue。  
欢迎给我提pull requests。  
更多信息详见代码，也可查看我的简书: [我的简书](http://www.jianshu.com/p/540a7e6f7b40)

最近更新: 
