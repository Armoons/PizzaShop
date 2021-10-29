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

struct bannerInfo {
    var title: String
    var image: UIImage
}

struct categoryInfo {
    var text: String
}

public struct cellsID {
    static let bannerCV = "bannerCollectionView"
    static let categoryCV = "categoryCollectionView"
    
}

let categoryArray = [
    categoryInfo(text: "Пицца"),
    categoryInfo(text: "Комбо"),
    categoryInfo(text: "Десерты"),
    categoryInfo(text: "Напитки"),
    categoryInfo(text: "Акции")
]

let bannerArray = [
    bannerInfo(title: "Sale30%", image: UIImage(named: "Banner1")! ),
    bannerInfo(title: "Sale30%", image: UIImage(named: "Banner1")! )
]

struct Colors {
    static let menuBackground: UIColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
    static let categoryText: UIColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
    static let categoryBackground: UIColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.5)

}

