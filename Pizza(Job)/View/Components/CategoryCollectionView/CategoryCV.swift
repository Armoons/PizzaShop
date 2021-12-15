//
//  CategoryCV.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 13.12.2021.
//

import Foundation
import UIKit

class CategoryCV: UICollectionView {
    
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
        self.backgroundColor = Colors.menuBackground
        self.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellsID.categoryCC)
        self.showsHorizontalScrollIndicator = false
        
        self.delegate = self
        self.dataSource = self
    }
}

extension CategoryCV: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: cellsID.categoryCC, for: indexPath) as! CategoryCollectionViewCell
        cellCategory.data = categoryArray[indexPath.row]
        return cellCategory
    }
}
