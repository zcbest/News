//
//  ThemeDataViewController.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/10.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import UIKit
import Alamofire

class ThemeDataViewController: UIViewController {

    var id: Int!
    let url = "http://news-at.zhihu.com/api/4/theme/"
    var item = [NewsCellModel]()
    var tableView = UITableView()
    var themeTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newUrl = url + String(id)
        getThemeData(newUrl)
        
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        
        self.navigationItem.title = themeTitle
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "More", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        
        self.view.addSubview(tableView)
        
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 80
    }

//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
    func getThemeData(url: String){
        Alamofire.request(.GET, url).responseJSON {response in
            let JSON = response.result.value
            let json = JSON?.objectForKey("stories")
            
            for var i = 0; i<json!.count; i = i + 1{
                let str1 = json![i].objectForKey("id")as! Int
                //图片url
                var str2:String?
                let sth = json?[i].objectForKey("images")
                if sth == nil{
                    str2 = "empty"
                    
                }else{
                    str2 = sth![0] as? String
                }
                
                let str3 = json![i].objectForKey("title")as! String
//                print(str1)
//                print(str2)
//                print(str3)
                self.item.append((NewsCellModel(id: str1, newsImageName: str2!, newsTitle: str3)))
            }
            self.tableView.reloadData()
        }

    }
    
    func back(){
        //返回上一级视图
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

