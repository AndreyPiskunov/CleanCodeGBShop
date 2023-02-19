//
//  ProductData.swift
//  GBShop
//
//  Created by Andrey Piskunov on 16.02.2023.
//

import Foundation

struct ProductData: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
