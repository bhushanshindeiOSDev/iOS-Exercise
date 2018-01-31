//
//  iOS_Code_ExerciseTests.swift
//  iOS-Code-ExerciseTests
//
//  Created by Bhushan Shinde on 30/01/18.
//  Copyright © 2018 Bhushan Shinde. All rights reserved.
//

import XCTest
@testable import iOS_Code_Exercise

class iOS_Code_ExerciseTests: XCTestCase {
    
    let networkRequestManager = NetworkRequestManager()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    // Test if response received from server is successfully parsed in json.
    func testJsonAPI(){
        networkRequestManager.makeNetworkRequest { (feedRows, title) in
           XCTAssertNil(title,"Feed is nil")
           XCTAssert(feedRows.count > 0)
        }
    }
    
}
