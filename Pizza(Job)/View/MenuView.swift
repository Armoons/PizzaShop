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
        return collection
    }()
    
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.menuBackground
        collection.layer.cornerRadius = 15
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.menuBackground
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.bannerCV)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.categoryCV)

        
        for subview in [cityName, dropDownImage, bannerCollectionView, categoryCollectionView] {
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
        
    }
}

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
            let cellBanner = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.bannerCV, for: indexPath) as! BannerCollectionViewCell
            cellBanner.data = bannerArray[indexPath.row]
            return cellBanner
            
        case self.categoryCollectionView:
            let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.categoryCV, for: indexPath) as! CategoryCollectionViewCell
            cellCategory.data = categoryArray[indexPath.row]
            return cellCategory
            
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        }
    }
}

