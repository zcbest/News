//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/3.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    var webView = UIWebView(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.width,UIScreen.mainScreen().bounds.height))
    var listUrl = "http://daily.zhihu.com/story/"
    var id:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载新闻详情
        loadRequest(listUrl+String(self.id))
        self.view.addSubview(webView)
    }

    func loadRequest(url: String){
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
