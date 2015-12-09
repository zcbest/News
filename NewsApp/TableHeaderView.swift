////
////  TableHeaderView.swift
////  NewsApp
////
////  Created by 曾超 on 15/12/8.
////  Copyright © 2015年 zengchao. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class TableHeaderView: UIView{
//    let width = UIScreen.mainScreen().bounds.width
//    let height = UIScreen.mainScreen().bounds.height
//    var headerView = UIView()
//    var scrollView = UIScrollView()
//    var button = UIButton()
//    var pageControl = UIPageControl()
////    var request = DataRequest()
//    
//    func loadHeaderView() -> UIView{
//        headerView = UIView(frame: CGRectMake(0,0,width,height/3))
////        self.tableView.tableHeaderView = headerView
//        
//        scrollView = UIScrollView(frame: CGRectMake(0,0,width,height/3))
//        //        scrollView.backgroundColor = UIColor.redColor()
//        //一定要加上scrollView的代理，不然不能进行回调
////        scrollView.delegate = self
//        scrollView.contentSize = CGSize(width: width*7, height: height/3)
//        //按页移动
//        scrollView.pagingEnabled = true
//        scrollView.bounces = true
//        //不显示水平移动的标记
//        scrollView.showsHorizontalScrollIndicator = false
//        headerView.addSubview(scrollView)
//        //button的width要注意width*7
//        button = UIButton(frame: CGRectMake(0,0,width*7,height/3))
//        button.addTarget(self, action: "jumpNext", forControlEvents: UIControlEvents.TouchUpInside)
//        scrollView.addSubview(button)
//        
//        pageControl = UIPageControl(frame: CGRectMake(width/3,height/3.5,width/2,23))
//        pageControl.numberOfPages = 5
//        pageControl.pageIndicatorTintColor = UIColor.yellowColor()
//        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
//        headerView.addSubview(pageControl)
//        
//        
//        for i in 1...self.items2.count{
//            let model = self.items2[i - 1]
//            let imageView = UIImageView(image: UIImage(data: NSData(contentsOfURL: NSURL(string: model.newsImageName)!)!))
//            imageView.frame = CGRectMake(width*CGFloat(i), 0, width, height/3)
//            scrollView.addSubview(imageView)
//            
//            let label = UILabel(frame: CGRectMake(100 + CGFloat(i) * width,100,width/2,height/9))
//            label.text = model.newsTitle
//            label.textColor = UIColor.whiteColor()
//            label.shadowColor = UIColor.blackColor()
//            label.numberOfLines = 3
//            scrollView.addSubview(label)
//        }
//        //添加第一页和最后一页
//        let imageView1 = UIImageView(image: UIImage(data: NSData(contentsOfURL: NSURL(string: self.items2.last!.newsImageName)!)!))
//        let label1 = UILabel(frame: CGRectMake(100 + CGFloat(0) * width,100,width/2,height/9))
//        label1.text = self.items2[4].newsTitle
//        label1.textColor = UIColor.whiteColor()
//        label1.shadowColor = UIColor.blackColor()
//        label1.numberOfLines = 3
//        imageView1.frame = CGRectMake(width*CGFloat(0), 0, width, height/3)
//        
//        let imageView2 = UIImageView(image: UIImage(data: NSData(contentsOfURL: NSURL(string: self.items2.first!.newsImageName)!)!))
//        let label2 = UILabel(frame: CGRectMake(100 + CGFloat(6) * width,100,width/2,height/9))
//        label2.text = self.items2[0].newsTitle
//        label2.textColor = UIColor.whiteColor()
//        label2.shadowColor = UIColor.blackColor()
//        label2.numberOfLines = 3
//        imageView2.frame = CGRectMake(width*CGFloat(6), 0, width, height/3)
//        
//        scrollView.addSubview(imageView1)
//        scrollView.addSubview(label1)
//        scrollView.addSubview(imageView2)
//        scrollView.addSubview(label2)
//        
//        return headerView
//    }
//
//}
