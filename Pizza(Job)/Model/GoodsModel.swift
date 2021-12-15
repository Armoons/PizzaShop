//
//  GoodsModel.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 12.12.2021.
//

import Foundation


struct GoodsModel: Decodable{
    
    var id: Int
    var category: String
    var name: String
    var topping: [String]?
    var price: Int
    var rank: Int?
}

