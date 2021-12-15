//
//  leftBarButtonView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 13.12.2021.
//

import Foundation
import UIKit

class leftBarButtonView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.addSubview(cityName)
        self.addSubview(dropDownImage)
        cityName.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(16)
        }
        
        dropDownImage.snp.makeConstraints{
            $0.left.equalTo(cityName.snp.right).offset(8)
            $0.centerY.equalToSuperview()
        }
    }
}
