//
//  BannerCollectionViewCell.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 29.10.2021.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var data: bannerInfo? {
        didSet {
            guard let data = data else { return }
            bigImageView.image = data.image
        }
    }
    
    private let bigImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bigImageView)
        bigImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
