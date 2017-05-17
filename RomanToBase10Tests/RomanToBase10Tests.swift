//
//  RomanToBase10Tests.swift
//  RomanToBase10Tests
//
//  Created by Vignan Kumar on 4/20/17.
//  Copyright © 2017 Vignan Kumar. All rights reserved.
//

import XCTest
@testable import RomanToBase10

class RomanToBase10Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let vc1 = ViewController()
        // on success returns a number, on failure returns 0
        XCTAssert(vc1.conversion(romanNumber: "CVIII") == 108)
        XCTAssert(vc1.conversion(romanNumber: "CVIIIV") == 0)
        XCTAssert(vc1.conversion(romanNumber: "yyyyyy") == 0)
        XCTAssert(vc1.conversion(romanNumber: "yyy") == 0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
