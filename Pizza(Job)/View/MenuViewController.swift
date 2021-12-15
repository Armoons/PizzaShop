//
//  MenuView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 27.10.2021.
//

import UIKit
protocol MenuViewControllerDelegate {
    func loaded(goodsInfo: [GoodsModel])
}

class MenuViewController: UIViewController {
    
    private let menuView = MenuView()
    private let service = GoodsService()
    private let navButton = leftBarButtonView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    
    var delegate: MenuViewControllerDelegate?

    override func loadView() {
       

        self.view = menuView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barItem = UIBarButtonItem(customView: navButton)
        self.navigationItem.leftBarButtonItem = barItem
        navigationController?.navigationBar.barTintColor = Colors.menuBackground
        
        navigationController?.navigationBar.backgroundColor = Colors.menuBackground
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = false

        
        service.delegate = self
        self.delegate = menuView
        service.loadInfo()
    }
}

extension MenuViewController: GoodsServiceDelegate {
    func loaded(goodsInfo: [GoodsModel]) {
        delegate?.loaded(goodsInfo: goodsInfo)
    }
}
