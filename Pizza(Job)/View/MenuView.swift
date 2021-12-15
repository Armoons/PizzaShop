//
//  MenuView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 11.12.2021.
//

import Foundation
import UIKit
import SnapKit

class MenuView: UIView{
    
    private let categoryCV = CategoryCV()
    
    private var goodsArray: [GoodsModel] = []
    
    private let goodsTableView: UITableView = {
        let tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.register(GoodsTableViewCell.self, forCellReuseIdentifier: cellsID.goodsTC)
        tv.register(BannerTableViewCell.self, forCellReuseIdentifier: cellsID.bannerTC)
        tv.rowHeight = 172
        tv.layer.cornerRadius = 20
        tv.allowsSelection = false
        tv.backgroundColor = Colors.menuBackground
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.goodsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.backgroundColor = Colors.menuBackground
        
        goodsTableView.delegate = self
        goodsTableView.dataSource = self
        
        for subview in [goodsTableView] {
            self.addSubview(subview)
        }
        
        goodsTableView.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension MenuView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return categoryCV
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellBanner = tableView.dequeueReusableCell(withIdentifier: cellsID.bannerTC, for: indexPath) as! BannerTableViewCell
            return cellBanner

        }
        let cellGoods = tableView.dequeueReusableCell(withIdentifier: cellsID.goodsTC, for: indexPath) as! GoodsTableViewCell
        cellGoods.data = goodsArray[indexPath.row]
        return cellGoods
    }
}

extension MenuView: MenuViewControllerDelegate {
    func loaded(goodsInfo: [GoodsModel]) {
        goodsArray = goodsInfo
        goodsTableView.reloadData()
    }
    
    
}


