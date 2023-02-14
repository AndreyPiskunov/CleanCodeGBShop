//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation
import Alamofire
 
protocol AbstractErrorParser {
    
    func parse(_ result: Error) -> Error
    
    func parse(response: HTTPURLResponse?,
               data: Data?,
               error: Error?) -> Error?
}
