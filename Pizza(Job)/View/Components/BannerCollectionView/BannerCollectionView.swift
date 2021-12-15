//
//  BannerCollectionView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 13.12.2021.
//

import Foundation
import UIKit

class BannerCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.alwaysBounceHorizontal = true
        self.backgroundColor = Colors.menuBackground
        self.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.bannerCC)
        self.showsHorizontalScrollIndicator = false
        
        self.delegate = self
        self.dataSource = self
    }
}

extension BannerCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 110)

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

// Making cv scrollable
extension BannerTableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
