//
//  foodModel.swift
//  UINagivationController
//
//  Created by 🍋 on 16/7/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class FoodModel: NSObject {
    var name: String!
    var pic: String!
    var content:String!
    var price: String!
    var buy: String!
    
    init(dict: [String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dict)
    }
}

