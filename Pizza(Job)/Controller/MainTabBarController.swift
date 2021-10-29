//
//  MainTabBarController.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 27.10.2021.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        self.delegate = (self as UITabBarControllerDelegate)
        setupTabBar()
    }
    
    func setupTabBar() {
        
        //        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)

        guard let menuImage: UIImage = UIImage(named: "MenuIcon") else { return }
        guard let locationImage: UIImage = UIImage(named: "LocationIcon") else { return }
        guard let profileImage: UIImage = UIImage(named: "ProfileIcon") else { return }
        guard let bagImage: UIImage = UIImage(named: "BagIcon") else { return }
        
        let menuController = createNavigationVC(vc:MenuView(), itemImage: menuImage, title: "Меню")
        let contactController = createNavigationVC(vc:ContactViewController(), itemImage: locationImage, title: "Контакты")
        let profileController = createNavigationVC(vc:ProfileViewController(), itemImage: profileImage, title: "Профиль")
        let shoppingBagController = createNavigationVC(vc:ShoppingBagViewController(), itemImage: bagImage, title: "Корзина")
        
        viewControllers = [menuController, contactController, profileController, shoppingBagController]
        
    }
}

extension UITabBarController {
    func createNavigationVC(vc: UIViewController, itemImage: UIImage, title: String) -> UINavigationController {
        let navigVC = UINavigationController(rootViewController: vc)
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        
        navigVC.tabBarItem.standardAppearance = tabAppearance
        navigVC.tabBarItem.scrollEdgeAppearance = tabAppearance
        navigVC.tabBarItem.image = itemImage
        navigVC.title = title
        return navigVC
    }
}