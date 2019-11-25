//
//  NYTimesDetailControllerTests.swift
//  NYTimesTests
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import XCTest
@testable import NYTimes

class NYTimesDetailControllerTests: XCTestCase {
    var viewCntrlr = NYTimesDetailController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "NYDetailController") as? NYTimesDetailController
            else {
                XCTFail("Could not instantiate vc from Main storyboard")
                return
        }
        viewCntrlr = vc
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Mark:- View loading tests
    func testViewLoads(){
        XCTAssertNotNil(self.viewCntrlr.view, "View not initiated properly")
    }
    
    
    
}
