//
//  GoodsCollectionViewCell.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 29.10.2021.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {
    
    var data: GoodsInfo? {
        didSet {
            guard let data = data else { return }
            imageView.image = data.image
            nameLabel.text = data.name
            descriptionLabel.text = data.description
            priceLabel.text = "от \(data.price) р"
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.sfBold, size: 17)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.sfLight, size: 13)
        label.textColor = Colors.descriptionText
        label.numberOfLines = 0
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.sfLight, size: 13)
        label.textColor = Colors.pink
        label.layer.borderColor = Colors.pink.cgColor
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 12
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.menuBackground.cgColor
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        for view in [imageView, nameLabel, descriptionLabel, priceLabel] {
            contentView.addSubview(view)
        }
        
        imageView.snp.makeConstraints{
            $0.left.top.bottom.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
//            $0.top.bottom.equalToSuperview().inset(24)
            $0.width.equalTo(imageView.snp.height).multipliedBy(1.0 / 1.0)
        }
        
        nameLabel.snp.makeConstraints{
            $0.right.greaterThanOrEqualTo(10)
            $0.top.equalTo(imageView.snp.top)
            $0.left.equalTo(imageView.snp.right).offset(32)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.left.equalTo(nameLabel.snp.left)
            $0.right.equalToSuperview().inset(24)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.lessThanOrEqualTo(-10)
            $0.width.equalTo(87)
            $0.height.equalTo(32)
        }
    }
}
