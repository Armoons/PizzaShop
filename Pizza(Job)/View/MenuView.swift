//
//  MenuView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 27.10.2021.
//

import Foundation
import UIKit

class MenuView: UIViewController {
    
    let bannerArray = [
        bannerInfo(title: "Sale30%", image: UIImage(named: "Banner1")! ),
        bannerInfo(title: "Sale30%", image: UIImage(named: "Banner1")! )
    ]
    
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
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        for subview in [cityName, dropDownImage, bannerCollectionView] {
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
        }
        
    }
    
    
}

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 112)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCollectionViewCell
        cell.data = bannerArray[indexPath.row]
//        cell.contentView.backgroundColor = .gray
        
        return cell
    }
    
    
}

