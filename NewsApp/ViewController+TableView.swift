//
//  ViewController+TableView.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/8.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    /**
     Description
     - returns: 块的数量，因为TableView的风格是plain，所以是1，默认也为1
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /**
     Description
     - returns: 每一个section有多少行。若为0的时候，则cellForIndexPath。。。不进行cell的绘制
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items1.count - items2.count
    }
    /**
     Description:该函数进行cell的绘制，包括系统定义或者自定义
     - parameter indexPath: 当前所在行
     - returns: 返回cell
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let initIdentifier = "MyCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier) as? NewsTableViewCell
        if cell == nil{
            tableView.registerNib(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: initIdentifier)
            cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier) as? NewsTableViewCell
        }
        //进行cell的绘制
        let model = self.items1[indexPath.row]
        
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "正在加载中，请稍候"
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            //利用SDWebImage异步加载图片
            cell?.headerImage.sd_setImageWithURL(NSURL(string: model.newsImageName))
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                cell?.headerLabel.text = model.newsTitle
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
                hud.hide(true)
                hud.removeFromSuperview()
            })
        }
//        cell?.headerImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: model.newsImageName)!)!)
        
        //图片圆角功能
//        cell?.headerImage.layer.cornerRadius = 60
//        cell?.headerImage.layer.masksToBounds = true
        return cell!
    }
    
    /**
     Description点击cell之后进行的相关操作
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let newsController = NewsListViewController()
        newsController.id = self.items1[indexPath.row].id
        self.navigationController?.pushViewController(newsController, animated: true)
    }
    
    /**
     Description
     - returns: 每个cell的高度
     */
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 83
    }
    
    /**
     Description:呈现cell的方式,动画效果
     函数名:tableViewwillDisplayCellforRowAtIndexPath
     */
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeTranslation(1, 1, 1)
        })
    }
}
