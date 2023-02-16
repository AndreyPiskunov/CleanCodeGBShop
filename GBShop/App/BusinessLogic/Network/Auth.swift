//
//  Auth.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Auth: AuthRequestFactory {
    
    func registrationUser(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Alamofire.AFDataResponse<RegistrationUser>) -> Void) {
        
        let requestModel = Registration(baseUrl: baseUrl, id: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func loginUser(userName: String, password: String, completionHandler: @escaping
               (AFDataResponse<LoginUser>) -> Void) {
        
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logoutUser(idUser: Int, completionHandler: @escaping
                (AFDataResponse<LogoutUser>) -> Void) {
        
        let requestModel = Logout(baseUrl: baseUrl, id: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Alamofire.AFDataResponse<ChangeUserData>) -> Void) {
        
        let requestModel = ChangeData(baseUrl: baseUrl, id: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

extension Auth {
    
     struct Logout: RequestRouter {
         let baseUrl: URL
         let method: HTTPMethod = .get
         let path: String = "logout.json"
         let id: Int
         var parameters: Parameters? {
             return [
                "id_user" : id
             ]
         }
     }
 }

extension Auth {
    
    struct Registration: RequestRouter, UserData {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "registerUser.json"
        var id: Int
        var userName: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        var parameters: Parameters? {
            return [
                "id_user" : id,
                "username" : userName,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}

extension Auth {
    
    struct ChangeData: RequestRouter, UserData {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "changeUserData.json"
        var id: Int
        var userName: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        var parameters: Parameters? {
            return [
                "id_user" : id,
                "username" : userName,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}
