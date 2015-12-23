//
//  ThemeDataViewController+TableView.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/11.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import Foundation
import UIKit

extension ThemeDataViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.count
    }
    
    //开始用方法中注释代码部分进行cell的绘制会有个小bug，就是没有图片的会复用有图片的cell，变成有图片的
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let initIdentifier = "MyThemeCell"
        //        var cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier) as? ThemeDataTableViewCell
        //        let url = self.item[indexPath.row].newsImageName
        //
        //        if cell == nil{
        //            tableView.registerNib(UINib(nibName: "ThemeDataTableViewCell", bundle: nil), forCellReuseIdentifier: initIdentifier)
        //            cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier) as? ThemeDataTableViewCell
        //        }
        //        //利用SDWebImage异步加载图片
        //        if url != "empty"{
        //            cell!.themeImageUrl.sd_setImageWithURL(NSURL(string: url))
        //        }
        //
        //        cell!.themeLabel.text = self.item[indexPath.row].newsTitle
        //
        //        return cell!
        let url = self.item[indexPath.row].newsImageName
        if url == "empty"{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            cell.textLabel!.text = self.item[indexPath.row].newsTitle
            cell.textLabel?.numberOfLines = 3
            cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(15))
            return cell
        }else{
            let initIdentifier = "MyThemeCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier) as? ThemeDataTableViewCell
            if cell == nil{
                tableView.registerNib(UINib(nibName: "ThemeDataTableViewCell", bundle: nil), forCellReuseIdentifier: initIdentifier)
                cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier) as? ThemeDataTableViewCell
            }
            
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "正在加载中，请稍候"
            
            dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
                //利用SDWebImage异步加载图片
                cell?.themeImageUrl.sd_setImageWithURL(NSURL(string: url))
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    cell?.themeLabel.text = self.item[indexPath.row].newsTitle
                    cell?.selectionStyle = UITableViewCellSelectionStyle.None
                    hud.hide(true)
                    hud.removeFromSuperview()
                })
            }
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let themeDataDetailView = NewsListViewController()
        themeDataDetailView.id = self.item[indexPath.row].id
        self.navigationController?.pushViewController(themeDataDetailView, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeRotation(60, 1, 1, 1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeTranslation(1, 1, 1)
        })
    }
}
