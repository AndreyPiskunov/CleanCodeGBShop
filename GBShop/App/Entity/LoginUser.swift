//
//  LoginResult.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation

struct LoginUser: Codable {
    let result: Int
    let user: User
}
