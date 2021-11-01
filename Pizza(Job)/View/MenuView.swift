//
//  MenuView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 27.10.2021.
//

import Foundation
import UIKit

class MenuView: UIViewController {
    
    private let cityName: UILabel = {
        let city = UILabel()
        city.text = "Москва"
        city.font = UIFont(name: Font.sfRegular, size: 17)
        return city
    }()
    
    private let dropDownImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DropDownIcon")
        return image
    }()
    
    private let bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.menuBackground
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.menuBackground
        collection.layer.cornerRadius = 15
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private let goodsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.menuBackground
        
        collection.layer.cornerRadius = 20
        collection.showsVerticalScrollIndicator = false
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.menuBackground
        setupConstraints()
        
//        setupJSON()
        
    }
    
   
    
//    func setupJSON() {
//        let urlString = "https://dodopizza.ru/moscow?utm_source=google&utm_medium=cpc&utm_campaign=arwm%20/%20Do%20/%20Search%20/%20Конверсии%20/%20Целевые%20запросы%20/&utm_term=пицца%20заказать%7Cmt:p&utm_content=astat:kwd-299857069885%7Cret:kwd-299857069885%7Ccid:12416882103%7Cgid:119027504100%7Caid:500740526079%7Cpos:%7Cst:%7Csrc:%7Cdvc:c%7Creg:9047027&gclid=Cj0KCQjwt-6LBhDlARIsAIPRQcJjhn_rxUinrttXmImafM2T7XoCd2cVFS8RL69l-VY5UFyWwZLxZAkaArIPEALw_wcB"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else { return }
//
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
//        }.resume()
//    }
    
    func setupConstraints() {
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.bannerCV)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.categoryCV)
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.bannerCV)

        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
        goodsCollectionView.register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.goodsCV)

        
        for subview in [cityName, dropDownImage, bannerCollectionView, categoryCollectionView, goodsCollectionView] {
            view.addSubview(subview)
        }
                
        cityName.snp.makeConstraints{
            $0.top.equalToSuperview().inset(60)
            $0.left.equalToSuperview().inset(16)
        }
        
        dropDownImage.snp.makeConstraints{
            $0.left.equalTo(cityName.snp.right).offset(8)
            $0.top.equalToSuperview().inset(67)
        }
        
        bannerCollectionView.snp.makeConstraints{
            $0.top.equalTo(cityName.snp.bottom).offset(24)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(112)
            $0.width.equalTo(300)
            
        }
        
        categoryCollectionView.snp.makeConstraints{
            $0.top.equalTo(bannerCollectionView.snp.bottom).offset(24)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(32)
            $0.width.equalTo(88)
        }
        
        goodsCollectionView.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(24)
            $0.bottom.equalToSuperview()
        }
        
    }
}

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case self.bannerCollectionView:
            return CGSize(width: 300, height: 112)
            
        case self.categoryCollectionView:
            return CGSize(width: 88, height: 32)
            
        case self.goodsCollectionView:
            return CGSize(width: view.frame.width, height: 172)

        default:
            return CGSize(width: 0, height: 0)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.bannerCollectionView:
            return bannerArray.count
            
        case self.categoryCollectionView:
            return categoryArray.count
            
        case self.goodsCollectionView:
            return goodsArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.bannerCollectionView:
            let cellBanner = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.bannerCV, for: indexPath) as! BannerCollectionViewCell
            cellBanner.data = bannerArray[indexPath.row]
            return cellBanner
            
        case self.categoryCollectionView:
            let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.categoryCV, for: indexPath) as! CategoryCollectionViewCell
            cellCategory.data = categoryArray[indexPath.row]
            return cellCategory
        
        case self.goodsCollectionView:
            let cellGoods = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.goodsCV, for: indexPath) as! GoodsCollectionViewCell
            cellGoods.data = goodsArray[indexPath.row]
//            if indexPath.row != 0 {
//                cellGoods.layer.borderWidth = 1
//                cellGoods.layer.borderColor = Colors.menuBackground.cgColor
//            }
            return cellGoods
            
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        }
    }
}

