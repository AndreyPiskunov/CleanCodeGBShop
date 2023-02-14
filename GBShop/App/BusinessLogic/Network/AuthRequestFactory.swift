//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
