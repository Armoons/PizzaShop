//
//  CategoryCollectionViewCell.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 29.10.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var didSelect = false
    
    var data: CategoryInfo? {
        didSet {
            guard let data = data else { return }
            name.text = data.text
        }
    }
    
    let name: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lightPink
        label.font = UIFont(name: Font.sfLight, size: 13)
        return label
    }()
    
    func selectCell() {
        self.didSelect = true
        self.backgroundColor = Colors.lighterPink
        self.layer.borderColor = Colors.lighterPink.cgColor
        name.font = UIFont(name: Font.sfBold, size: 13)
        name.textColor = Colors.pink

    }
    
    func deselectCell() {
        self.didSelect = false
        self.backgroundColor = .clear
        self.layer.borderColor = Colors.lightPink.cgColor
        name.font = UIFont(name: Font.sfLight, size: 13)
        name.textColor = Colors.lightPink
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(name)
        name.snp.makeConstraints{
            $0.center.equalTo(contentView.center)
        }
        
        
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.lightPink.cgColor
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
