//
//  ViewController.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/3.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, DataRequestDelegate, UIScrollViewDelegate{

    var tableView = UITableView()
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    var items1 = [NewsCellModel]()
    var items2 = [NewsCellModel]()
    //头条新闻中的属性
    var headerView = UIView()
    var scrollView = UIScrollView()
    var button = UIButton()
    var pageControl = UIPageControl()
    var request = DataRequest()
    
    //最新新闻的url
    let url = "http://news-at.zhihu.com/api/4/news/latest"
    //下拉刷新控件
    var header = MJRefreshNormalHeader()
    
    //实现协议DataRequestDelegate的方法
    func transforValue(item1: AnyObject) {
        self.items1 = item1 as! [NewsCellModel]
        let num = self.items1.count
        self.items2 = [items1[num - 5],items1[num - 4],items1[num - 3]
            ,items1[num - 2],items1[num - 1]]
//        for i in 0...4{
//            print(self.items2[i].id)
//            print(self.items2[i].newsTitle)
//            print(self.items2[i].newsImageName)
//        }
        //加载TableHeader,items有值才会加载，不然会出现数组越界
        loadHeaderView()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRectMake(0, 0, width, height), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self

        //进行网络请求
        request = DataRequest()
        request.delegate = self
        request.alamofireRequest(url)
        
        //隐藏navigationBar
//        self.navigationController?.navigationBarHidden = true
        self.navigationItem.title = "今日新闻"

        //添加navigationBarButton 
        //https://github.com/dekatotoro/SlideMenuControllerSwift 有相关用法
        self.addLeftBarButtonWithImage(UIImage(named: "menu")!)
        self.addRightBarButtonWithImage(UIImage(named:"people")!)
            
        //MJ进行下拉刷新
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "downRefresh")
     
        //MJ上拉加载
        self.tableView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: "upRefresh")
        
        self.view.addSubview(tableView)
        
        //定时器控制头条新闻进行跳转
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "AutoScroll", userInfo: nil, repeats: true)
        //iOS 8开始的自适应高度，可以不需要实现定义高度的方法
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 120
    }
    /**
     Description:下拉刷新实现方法
     */
    func downRefresh(){
        self.tableView.mj_header.beginRefreshing()
        request = DataRequest()
        request.alamofireRequest(url)
        self.tableView.reloadData()
        self.tableView.mj_header.endRefreshing()
    }
    /**
     Description:上拉加载实现方法
     */
    func upRefresh(){
        self.tableView.mj_footer.beginRefreshing()
//        self.tableView.reloadData()
        self.tableView.mj_footer.endRefreshing()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //SDWebImage清除磁盘和内存中的缓存
        SDImageCache.sharedImageCache().clearDisk()
        SDImageCache.sharedImageCache().clearMemory()
        // Dispose of any resources that can be recreated.
    }


    /**
     Description:Button的监听函数
     */
    func jumpNext(){
        let newsController = NewsListViewController()
        let page = self.scrollView.contentOffset.x/width
        let index = Int(page)
        //page的取值是0，1，2，3，4，5，6 有值的index是0，1，2，3，4
        if index == 0{
            newsController.id = self.items2[index + self.items2.count - 1].id
        }
        else if (index == 6){
            newsController.id = self.items2[index % 5 - 1].id
        }
        else{
            newsController.id = self.items2[index - 1].id
        }
        self.navigationController?.pushViewController(newsController, animated: true)
    }
    
    /**
     Description:加载TableHeader视图
     */
    func loadHeaderView(){
        headerView = UIView(frame: CGRectMake(0,0,width,height/3))
        self.tableView.tableHeaderView = headerView
        
        scrollView = UIScrollView(frame: CGRectMake(0,0,width,height/3))
        //        scrollView.backgroundColor = UIColor.redColor()
        //一定要加上scrollView的代理，不然不能进行回调
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: width*7, height: height/3)
        //按页移动
        scrollView.pagingEnabled = true
        scrollView.bounces = true
        //不显示水平移动的标记
        scrollView.showsHorizontalScrollIndicator = false
        headerView.addSubview(scrollView)
        //button的width要注意width*7
        button = UIButton(frame: CGRectMake(0,0,width*7,height/3))
        button.addTarget(self, action: "jumpNext", forControlEvents: UIControlEvents.TouchUpInside)
        scrollView.addSubview(button)
        
        pageControl = UIPageControl(frame: CGRectMake(width/3,height/3.5,width/2,23))
        pageControl.numberOfPages = 5
        pageControl.pageIndicatorTintColor = UIColor.yellowColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        headerView.addSubview(pageControl)
        
        
        for i in 1...self.items2.count{
            let model = self.items2[i - 1]
            let imageView = UIImageView(image: UIImage(data: NSData(contentsOfURL: NSURL(string: model.newsImageName)!)!))
            imageView.frame = CGRectMake(width*CGFloat(i), 0, width, height/3)
            scrollView.addSubview(imageView)
            
            let label = UILabel(frame: CGRectMake(100 + CGFloat(i) * width,100,width/2,height/9))
            label.text = model.newsTitle
            label.textColor = UIColor.whiteColor()
            label.shadowColor = UIColor.blackColor()
            label.numberOfLines = 3
            scrollView.addSubview(label)
        }
        //添加第一页和最后一页
        let imageView1 = UIImageView(image: UIImage(data: NSData(contentsOfURL: NSURL(string: self.items2.last!.newsImageName)!)!))
        let label1 = UILabel(frame: CGRectMake(100 + CGFloat(0) * width,100,width/2,height/9))
        label1.text = self.items2[4].newsTitle
        label1.textColor = UIColor.whiteColor()
        label1.shadowColor = UIColor.blackColor()
        label1.numberOfLines = 3
        imageView1.frame = CGRectMake(width*CGFloat(0), 0, width, height/3)
        
        let imageView2 = UIImageView(image: UIImage(data: NSData(contentsOfURL: NSURL(string: self.items2.first!.newsImageName)!)!))
        let label2 = UILabel(frame: CGRectMake(100 + CGFloat(6) * width,100,width/2,height/9))
        label2.text = self.items2[0].newsTitle
        label2.textColor = UIColor.whiteColor()
        label2.shadowColor = UIColor.blackColor()
        label2.numberOfLines = 3
        imageView2.frame = CGRectMake(width*CGFloat(6), 0, width, height/3)
        
        scrollView.addSubview(imageView1)
        scrollView.addSubview(label1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(label2)
        
    }
    /**
     Description:减速停止调用，实现滚动循环
     */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page: Int = Int(scrollView.contentOffset.x / width)
        if page == 0{
            scrollView.scrollRectToVisible(CGRectMake(CGFloat(self.items2.count) * width, 0, width, height/3), animated: false)
        }
        else if page == self.items2.count + 1{
            scrollView.scrollRectToVisible(CGRectMake(width, 0, width, height/3), animated: false)
        }
    }
    /**
     Description:每次滚动的时候进行调用
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / width
        //圆点控制器
        self.pageControl.currentPage = Int(page - 1)
    }
    //自动滚动
    func AutoScroll(){
        var page = self.pageControl.currentPage
        page++
        //当page=5的时候就要跳转到新的循环了
        page = page > 4 ? 0 : page
        self.pageControl.currentPage = page
        scrollView.scrollRectToVisible(CGRectMake(CGFloat(page) * width + width , 0, width, height/3), animated: false)
    }
}

