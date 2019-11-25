//
//  APIRequestTest.swift
//  NYTimesTests
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import Foundation
import XCTest
@testable import NYTimes

class APIRequestTest: XCTestCase {
    var sessionUnderTest: URLSession!
    var newsClient : NewsClient!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        newsClient = NewsClient()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //apiRequestHandlerUnderTest = nil
        super.tearDown()
    }

    /// Asynchronous test: success fast, failure slow
    /// This is an example of a performance test case for calling MostViewed API
    func testTopRatedAPICall() {
        // given
        weak var expectation = self.expectation(description: "Response Received")
        
        self.newsClient.getFeed(from: .topRated) { result in
            switch result {
            case .success(let value):
                XCTAssertNotNil(value)
                expectation?.fulfill()
            case .failure(let error):
                print("the error \(error)")
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 30) { error in
            XCTAssertNil(error)
        }
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToApiGetsHTTPStatusCode200() {
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=3Zk5vXeyYbRLeeWSHFRlFaEIRqDAp9Yy")
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
}
