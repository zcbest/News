//
//  AuthorInfoViewController.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/11.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import UIKit

class AuthorInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func githubClicked(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/hnuzengchao")!)
    }

    @IBAction func blogClicked(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://blog.csdn.net/hnuzengchao")!)
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
