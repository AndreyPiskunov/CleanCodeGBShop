//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Andrey Piskunov on 17.02.2023.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    
    func getProduct(idProduct: Int,
                    completionHandler: @escaping (AFDataResponse<ProductData>) -> Void)
    
    func getProductCatalog(pageNumber: Int,
                           idCategory: Int,
                           completionHandler: @escaping (AFDataResponse<[ProductList]>) -> Void)
}
