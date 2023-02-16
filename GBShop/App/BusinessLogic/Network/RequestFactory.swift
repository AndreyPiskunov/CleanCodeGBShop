//
//  RequestFactory.swift
//  GBShop
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import Foundation
import Alamofire

class RequestFactory {
    
    lazy var commonSession: Session = {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
