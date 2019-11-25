//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import XCTest
@testable import NYTimes

class NYTimesTableViewTest: XCTestCase {
    
    var viewCntrlr = NYTimesFeedController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: NYTimesFeedController = storyboard.instantiateViewController(withIdentifier: "NYViewController") as! NYTimesFeedController
        viewCntrlr = vc
        _ = viewCntrlr.view // To call viewDidLoad
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Mark:- View loading tests
    func testViewLoads(){
        XCTAssertNotNil(self.viewCntrlr.view, "View not initiated properly")
    }
    
    func testParentViewHasTableViewSubview(){
        XCTAssertTrue(self.viewCntrlr.view.subviews.contains(self.viewCntrlr.tableView), "View does not have a table subview")
    }
    
    func testThatTableViewLoads(){
        XCTAssertNotNil(self.viewCntrlr.tableView, "TableView not initiated")
    }
    
    //Mark:- UITableView tests
    func testForUITableViewDataSource(){
        XCTAssertTrue(self.viewCntrlr .conforms(to: UITableViewDataSource.self), "View does not conform to UITableView datasource protocol")
    }
    
    func testThatTableViewHasDataSource(){
        XCTAssertNotNil(self.viewCntrlr.tableView.dataSource, "Table datasource cannot be nil")
    }
    
    func testForUITableViewDelegate(){
        XCTAssertTrue(self.viewCntrlr .conforms(to: UITableViewDelegate.self), "View does not conform to UITableView delegate protocol")
    }
    
    func testTableViewIsConnectedToDelegate(){
         XCTAssertNotNil(self.viewCntrlr.tableView.delegate, "Table delegate cannot be nil")
    }

    
}
