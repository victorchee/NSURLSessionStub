//
//  APIClientTests.swift
//  NSURLSessionStub
//
//  Created by qihaijun on 1/25/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

import XCTest
@testable import NSURLSessionStub

class APIClientTests: XCTestCase {

    var apiClient: APIClient!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiClient = APIClient()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFetchingProfile() {
        // Arrage
        let responseString = "{\"login\": \"victor\", \"id\": 123321}"
        let responseData = responseString.dataUsingEncoding(NSUTF8StringEncoding)!
        let sessionMock = URLSessionMock(data: responseData, response: nil, error: nil)
        apiClient.session = sessionMock
        
        // Act
        apiClient.fetchProfileWithName("victor")
        
        // Assert
        let user = apiClient.user
        let expectedUser = User(name: "victor", id: 123321)
        XCTAssertEqual(user, expectedUser)
    }
}
