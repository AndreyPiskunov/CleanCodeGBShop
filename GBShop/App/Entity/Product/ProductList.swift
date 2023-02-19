//
//  ProdList.swift
//  GBShop
//
//  Created by Andrey Piskunov on 17.02.2023.
//

import Foundation

struct ProductList: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
