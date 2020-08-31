//
//  OtherTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/31.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo
class OtherTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testGreatestCommon() {
        let res = OtherPractice.getGreatestCommonDivisor(a: 25, b: 5)
        XCTAssertTrue(res == 5)
        
        let res2 = OtherPractice.getGreatestCommonDivisor(a: 100, b: 80)
        XCTAssertTrue(res2 == 20)
        
        let res3 = OtherPractice.getGreatestCommonDivisor(a: 27, b: 14)
        XCTAssertTrue(res3 == 1)
    }
    
    func testGgcdOptimize() {
        let res = OtherPractice.ggcdOptimize(a: 25, b: 5)
        XCTAssertTrue(res == 5)
        
        let res2 = OtherPractice.ggcdOptimize(a: 100, b: 80)
        XCTAssertTrue(res2 == 20)
        
        let res3 = OtherPractice.ggcdOptimize(a: 27, b: 14)
        XCTAssertTrue(res3 == 1)
    }
    
    func testIsPowerOfTwo() {
        XCTAssertTrue(OtherPractice.isPowerOfTwo(num: 8))
        XCTAssertFalse(OtherPractice.isPowerOfTwo(num: 7))
    }
}
