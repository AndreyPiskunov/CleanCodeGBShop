//
//  ErrorParser.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation
import Alamofire

class ErrorParser: AbstractErrorParser {
    
    func parse(_ result: Error) -> Error { return result }
    
    func parse(response: HTTPURLResponse?,
               data: Data?,
               error: Error?) -> Error? { return error }
}
