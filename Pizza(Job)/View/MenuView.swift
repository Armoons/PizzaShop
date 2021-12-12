//
//  MenuView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 11.12.2021.
//

import Foundation
import UIKit
import SnapKit

class MenuView: UIView {
    
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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.menuBackground
        collection.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.bannerCC)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.menuBackground
        collection.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.categoryCC)
        collection.layer.cornerRadius = 15
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private let goodsTableView: UITableView = {
        let tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.register(GoodsTableViewCell.self, forCellReuseIdentifier: cellsID.goodsTC)
        tv.rowHeight = 172
        tv.layer.cornerRadius = 20
        tv.allowsSelection = false
        tv.backgroundColor = Colors.menuBackground
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupConstraints() {
        
        self.backgroundColor = Colors.menuBackground
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        goodsTableView.delegate = self
        goodsTableView.dataSource = self

        

        
        for subview in [cityName, dropDownImage, bannerCollectionView, categoryCollectionView, goodsTableView] {
            self.addSubview(subview)
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
            $0.left.equalToSuperview()
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(112)
            $0.width.equalTo(300)
            
        }
        
        categoryCollectionView.snp.makeConstraints{
            $0.top.equalTo(bannerCollectionView.snp.bottom).offset(24)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(32)
            $0.width.equalTo(88)
        }
        
        goodsTableView.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(24)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case self.bannerCollectionView:
            return CGSize(width: 300, height: 112)
            
        case self.categoryCollectionView:
            return CGSize(width: 88, height: 32)

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
    
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.bannerCollectionView:
            let cellBanner = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.bannerCC, for: indexPath) as! BannerCollectionViewCell
            cellBanner.data = bannerArray[indexPath.row]
            return cellBanner
            
        case self.categoryCollectionView:
            let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.categoryCC, for: indexPath) as! CategoryCollectionViewCell
            cellCategory.data = categoryArray[indexPath.row]
            return cellCategory
            
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        }
    }
}

extension MenuView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellGoods = tableView.dequeueReusableCell(withIdentifier: cellsID.goodsTC, for: indexPath) as! GoodsTableViewCell
        cellGoods.data = goodsArray[indexPath.row]
        return cellGoods
    }
    
    
}
