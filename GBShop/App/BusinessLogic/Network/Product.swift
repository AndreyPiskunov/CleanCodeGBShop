//
//  Product.swift
//  GBShop
//
//  Created by Andrey Piskunov on 17.02.2023.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Product: ProductRequestFactory {
    
    func getProduct(idProduct: Int, completionHandler: @escaping (Alamofire.AFDataResponse<ProductData>) -> Void) {
        
        let requestModel = GetProductData(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProductCatalog(pageNumber: Int, idCategory: Int, completionHandler: @escaping (Alamofire.AFDataResponse<[ProductList]>) -> Void) {
        
        let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Product {
    
    struct GetProductData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        var idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct
            ]
        }
    }
}

extension Product {
    
    struct CatalogData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "сatalogData.json"
        var pageNumber: Int
        var idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number" : pageNumber,
                "id_category" : idCategory
            ]
        }
    }
}
