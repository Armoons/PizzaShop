//
//  MenuView.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 27.10.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let menuView = MenuView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = menuView
//        setupJSON()
        
    }
    
   
    
//    func setupJSON() {
//        let urlString = "https://dodopizza.ru/moscow?utm_source=google&utm_medium=cpc&utm_campaign=arwm%20/%20Do%20/%20Search%20/%20Конверсии%20/%20Целевые%20запросы%20/&utm_term=пицца%20заказать%7Cmt:p&utm_content=astat:kwd-299857069885%7Cret:kwd-299857069885%7Ccid:12416882103%7Cgid:119027504100%7Caid:500740526079%7Cpos:%7Cst:%7Csrc:%7Cdvc:c%7Creg:9047027&gclid=Cj0KCQjwt-6LBhDlARIsAIPRQcJjhn_rxUinrttXmImafM2T7XoCd2cVFS8RL69l-VY5UFyWwZLxZAkaArIPEALw_wcB"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else { return }
//
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
//        }.resume()
//    }
    
    
}




