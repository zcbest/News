# NewsApp
仿知乎日报的简易新闻客户端

开发该App的步骤如下:

-Step 1:界面布局TableView(HeadView以及TableViewCell),自定义TableViewCell;

-Step 2:通过Alamofire三方库进行Json解析,为Model赋值;同时在view初始化的时候添加TableHeader,即为头条新闻;

-Step 3:添加WebViewController,获取新闻ID,通过拼接url来显示详情;

-Step 4:集成三方库,MJRefresh用来刷新和加载,SDWebImage用来异步加载cell中的图片;

-Step 5:头条新闻的循环滚动以及访问新闻详情.
