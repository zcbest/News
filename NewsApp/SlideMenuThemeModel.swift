//
//  SlideMenuThemeModel.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/10.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import Foundation

class SlideMenuThemeModel: NSObject{
    var id:Int!
    var name:String!
    
    init(id:Int, name:String) {
        self.id = id
        self.name = name
    }
}