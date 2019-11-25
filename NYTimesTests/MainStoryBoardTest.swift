//
//  MainStoryBoardTest.swift
//  NYTimesTests
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

@testable import NYTimes
import XCTest

class MainStoryBoardTest: XCTestCase {

        // MARK: Varibels To test

    // (SUT) system unit under test
    var storyboardUnderTest: UIStoryboard!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Given
        storyboardUnderTest = UIStoryboard(name: "Main",
                                           bundle: Bundle.main)
        // Then
        XCTAssertNotNil(storyboardUnderTest)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboardUnderTest = nil
        super.tearDown()
    }

    func testMostViewedMasterViewController() {
        // Given
        let feedsViewController = storyboardUnderTest.instantiateViewController(withIdentifier: "NYTimesFeedController")
        // Then
        XCTAssertNotNil(feedsViewController)
        XCTAssertTrue(feedsViewController is NYTimesFeedController)
    }

    func testDetailViewController() {
        // Given
        let detailViewController = storyboardUnderTest.instantiateViewController(withIdentifier: "NYTimesDetailController")
        //then
        XCTAssertNotNil(detailViewController)
        XCTAssertTrue(detailViewController is NYTimesDetailController)
    }

}
