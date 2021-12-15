//
//  Model.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 28.10.2021.
//

import Foundation
import UIKit

public struct Font {
    static let sfRegular: String = "SFUIDisplay-Regular"
    static let sfBold: String = "SFUIDisplay-Bold"
    static let sfLight: String = "SFUIDisplay-Light"
}

struct BannerInfo {
    var title: String
    var image: UIImage
}

struct CategoryInfo {
    var text: String
}

struct GoodsInfo {
    var image: UIImage
    var name: String
    var description: String
    var price: String
}

//let goodsArray = [
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы1", description: "бабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааб", price: "345"),
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы2", description: "бабабаббааб", price: "345"),
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы3", description: "бабабаббааб", price: "345"),
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы4", description: "бабабаббааб", price: "345"),
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы1", description: "бабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааб", price: "345"),
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы1", description: "бабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааб", price: "345"),
//    GoodsInfo(image: UIImage(named: "Pizza1")!, name: "Ветчина и грибы1", description: "бабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааббабабаббааб", price: "345")
//
//]

public struct cellsID {
    static let bannerCC = "bannerCollectionCell"
    static let categoryCC = "categoryCollectionCell"
    static let goodsTC = "goodsTableCell"
    static let bannerTC = "bannerTableCell"

    
}

let categoryArray = [
    CategoryInfo(text: "Пицца"),
    CategoryInfo(text: "Комбо"),
    CategoryInfo(text: "Десерты"),
    CategoryInfo(text: "Напитки"),
    CategoryInfo(text: "Акции")
]

let bannerArray = [
    BannerInfo(title: "Sale30%", image: UIImage(named: "Banner1")! ),
    BannerInfo(title: "Sale30%", image: UIImage(named: "Banner1")! )
]

struct Colors {
    static let menuBackground: UIColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
    static let pink: UIColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
    static let lightPink: UIColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.5)
    static let descriptionText: UIColor = UIColor(red: 170/255, green: 170/255, blue: 173/255, alpha: 1)

}

