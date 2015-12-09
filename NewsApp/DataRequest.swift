//
//  DataRequest.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/3.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import Foundation
import Alamofire

class DataRequest: NSObject{
    var item: [NewsCellModel] = []
    var delegate:DataRequestDelegate?

    func alamofireRequest(url: String){
        var model: NewsCellModel?
        Alamofire.request(.GET, url, parameters: ["foo": "bar"])
            .responseJSON { response in
                if let JSON = response.result.value {
                    if let json = JSON.objectForKey("stories"){
                        for var i = 0; i<json.count; i = i + 1{
                            let str1 = json[i].objectForKey("id")as! Int
                            //注意images格式，字符串数组
                            let str2 = json[i].objectForKey("images")![0]as! String
                            let str3 = json[i].objectForKey("title")as! String
//                            print(str1)
//                            print(str2)
//                            print(str3)
                            model = NewsCellModel(id: str1, newsImageName: str2, newsTitle: str3)
                            self.item.append(model!)
                        }

                    }
                    if let json = JSON.objectForKey("top_stories"){
                        for var i = 0; i<json.count; i = i + 1{
                            let str1 = json[i].objectForKey("id")as! Int
                            //注意images格式，字符串数组
                            let str2 = json[i].objectForKey("image")as! String
                            let str3 = json[i].objectForKey("title")as! String
//                                                        print(str1)
//                                                        print(str2)
//                                                        print(str3)
                            model = NewsCellModel(id: str1, newsImageName: str2, newsTitle: str3)
                            self.item.append(model!)
                        }
                        
                    }
                    //调用代理方法
                    self.delegate?.transforValue(self.item)
                }
        }
    }
}