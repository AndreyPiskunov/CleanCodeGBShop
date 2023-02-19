//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Andrey Piskunov on 13.02.2023.
//

import XCTest
import Alamofire
@testable import GBShop

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

final class ResponseCodableTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var requestFactory: RequestFactory!
    
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
        requestFactory = RequestFactory()
    }
    override func tearDown() {
        super.tearDown()
        errorParser = nil
        requestFactory = nil
    }
    //MARK: - Test functions
    
    func testShouldDownloadAndParse() {
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAuthShouldLogin() {
        let auth = requestFactory.makeAuthRequestFactory()
        let name = "Somebody"
        let password = "mypassword"
        var result: Int = 007
        
        auth.loginUser(userName: name, password: password) { response in
            switch response.result {
            case .success(let login):
                result = login.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertEqual(1, result)
        XCTAssertNotEqual(0, result)
    }
    
    func testAuthShouldLogout() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        var result = 007
        
        auth.logoutUser(idUser: id) { response in
            switch response.result {
            case .success(let logout):
                result = logout.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertEqual(1, result)
        XCTAssertNotEqual(0, result)
    }
    
    func testAuthShouldRegister() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        var result = 007
        
        auth.registrationUser(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let registration):
                result = registration.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertEqual(1, result)
        XCTAssertNotEqual(0, result)
    }
    
    func testAuthShouldChangeData() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        var result = 88
        
        auth.changeUserData(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let change):
                result = change.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertEqual(1, result)
        XCTAssertNotEqual(0, result)
    }
    
    func testProductShouldReturn() {
        let product = requestFactory.makeProductRequestFactory()
        let id = 123
        var itemResult = 2
        
        product.getProduct(idProduct: id) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }
}
