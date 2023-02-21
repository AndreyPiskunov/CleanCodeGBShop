//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    
    func loginUser(userName: String,
                   password: String,
                   completionHandler: @escaping (AFDataResponse<LoginUser>) -> Void)
    
    func logoutUser(idUser: Int,
                    completionHandler: @escaping (AFDataResponse<LogoutUser>) -> Void)
    
    func registrationUser(idUser: Int,
                          userName: String,
                          password: String,
                          email: String,
                          gender: String,
                          creditCard: String,
                          bio: String,
                          completionHandler: @escaping (AFDataResponse<RegistrationUser>) -> Void)
    
    func changeUserData(idUser: Int,
                        userName: String,
                        password: String,
                        email: String,
                        gender: String,
                        creditCard: String,
                        bio: String,
                        completionHandler: @escaping (AFDataResponse<ChangeUserData>) -> Void)
}
