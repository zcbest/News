//
//  NewsCellModel.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/3.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import Foundation

class NewsCellModel: NSObject{
    var id: Int!
    var newsImageName: String!
    var newsTitle: String!
    
    init(id: Int, newsTitle: String) {
        self.id = id
        self.newsTitle = newsTitle
    }
    
    init(id: Int,newsImageName: String, newsTitle: String) {
        self.id = id
        self.newsImageName = newsImageName
        self.newsTitle = newsTitle
    }
    
}