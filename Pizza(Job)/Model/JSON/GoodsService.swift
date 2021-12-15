//
//  GoodsService.swift
//  Pizza(Job)
//
//  Created by Stepanyan Arman  on 12.12.2021.
//

import Foundation

protocol GoodsServiceDelegate {
    func loaded(goodsInfo: [GoodsModel])
}

class GoodsService {

    static let urlString = "https://private-anon-1b5f19f03b-pizzaapp.apiary-mock.com/restaurants/restaurantId/menu"
    
    var delegate: GoodsServiceDelegate?
    
    func loadInfo() {
        guard let url = URL(string: Self.urlString) else { return }
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }

            do {
                let goodsArray = try JSONDecoder().decode([GoodsModel].self, from: data)
                DispatchQueue.main.async {
                    delegate?.loaded(goodsInfo: goodsArray)
                }
            }  catch {
                print(error)
            }
        }.resume()
    }
}
