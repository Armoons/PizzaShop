//
//  BannerCell.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 13.12.2021.
//

import Foundation
import UIKit

class BannerTableViewCell: UITableViewCell {
    
    let bannerCV = BannerCollectionView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.addSubview(bannerCV)
        
        bannerCV.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}


extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 112)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellBanner = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.bannerCC, for: indexPath) as! BannerCollectionViewCell
        cellBanner.data = bannerArray[indexPath.row]
        return cellBanner
    }
}
