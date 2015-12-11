//
//  ThemeDataTableViewCell.swift
//  NewsApp
//
//  Created by 曾超 on 15/12/11.
//  Copyright © 2015年 zengchao. All rights reserved.
//

import UIKit

class ThemeDataTableViewCell: UITableViewCell {

    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeImageUrl: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
