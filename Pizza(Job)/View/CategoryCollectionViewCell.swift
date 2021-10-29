//
//  CategoryCollectionViewCell.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 29.10.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var data: categoryInfo? {
        didSet {
            guard let data = data else { return }
            name.text = data.text
        }
    }
    
    let name: UILabel = {
        let label = UILabel()
        label.textColor = Colors.categoryBackground
        label.font = UIFont(name: Font.sfLight, size: 13)
//        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(name)
        name.snp.makeConstraints{
            $0.center.equalTo(contentView.center)
        }
        
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.categoryBackground.cgColor
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
