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
               completionHandler: @escaping (AFDataResponse<LoginUser>) -> Void)
    
    func logout(idUser: Int,
                completionHandler: @escaping (AFDataResponse<LogoutUser>) -> Void)
    
    func registration(idUser: Int,
                      userName: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      bio: String,
                      completionHandler: @escaping (AFDataResponse<RegistrationUser>) -> Void)
    
    func changeData(idUser: Int,
                    userName: String,
                    password: String,
                    email: String,
                    gender: String,
                    creditCard: String,
                    bio: String,
                    completionHandler: @escaping (AFDataResponse<ChangeUserData>) -> Void)
}

