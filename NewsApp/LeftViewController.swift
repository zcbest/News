//
//  LeftViewController.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/10.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import UIKit

class LeftViewController: UITableViewController,ThemeDataRequstDelegate {
    //主题日报列表
    var themedata:[SlideMenuThemeModel] = []
    
    //实现请求数据代理协议
    func transforThemeDataValue(list: AnyObject) {
        self.themedata = list as! [SlideMenuThemeModel]
        //切记不能掉reloadData，否则要手动刷新
        self.tableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Grouped)
        
        self.view.backgroundColor = UIColor.grayColor()
        //被委托对象设置代理
        let request = DataRequest()
        request.delegate1 = self
        request.getThemesData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else{
            return themedata.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        if indexPath.section == 0{
            cell.textLabel?.text = "首页"
            cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        }
        else{
            cell.textLabel?.text = themedata[indexPath.row].name
            cell.accessoryType = UITableViewCellAccessoryType.DetailButton
//            print(cell.textLabel?.text)
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0{
            //关掉侧面菜单
            self.slideMenuController()?.closeLeft()
        }
        else{
            let newViewController = ThemeDataViewController()
            newViewController.id = themedata[indexPath.row].id
            newViewController.themeTitle = themedata[indexPath.row].name
            let nav = UINavigationController(rootViewController: newViewController)
            self.presentViewController(nav, animated: true, completion: nil)
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }


}
