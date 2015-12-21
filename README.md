# NewsApp
> **仿知乎日报的简单新闻客户端——适合Swift新手入门**

开发过程详见[我的博客](http://blog.csdn.net/hnuzengchao )

开发该App的步骤如下:

-Step 1:界面布局TableView(HeadView以及TableViewCell),自定义TableViewCell;

-Step 2:通过Alamofire三方库进行Json解析,为Model赋值;同时在view初始化的时候添加TableHeader,即为头条新闻;

-Step 3:添加WebViewController,获取新闻ID,通过拼接url来显示详情;

-Step 4:集成三方库,MJRefresh用来刷新和加载,SDWebImage用来异步加载cell中的图片;

-Step 5:头条新闻的循环滚动以及访问新闻详情;

-Step 6:引进侧栏菜单的三方库，建立菜单并进行菜单内容的填充和布局以及首页的跳转

-Step 7:侧栏菜单项的跳转返回以及解决侧栏菜单新闻详情cell的复用问题

-Step 8:右侧菜单栏添加我的github和我的博客链接

![App部分功能如下](http://img.blog.csdn.net/20151210104240897)   ![App功能二](http://img.blog.csdn.net/20151210104732078)   ![App功能三](http://img.blog.csdn.net/20151211162154407)   ![App功能四](http://img.blog.csdn.net/20151221150229561)
