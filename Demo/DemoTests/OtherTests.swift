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
    
    func testBigNumSum() {
        let res1 = OtherPractice.bigNumSum(num1: "4268764637298263637", num2: "9287674899027364")
        XCTAssert(res1 == "4278052312197291001")

        let res2 = OtherPractice.bigNumSum(num1: "11111111111", num2: "22222222222")
        XCTAssert(res2 == "33333333333")
        
        let res3 = OtherPractice.bigNumSum(num1: "1111111111", num2: "22222222222")
        XCTAssert(res3 == "23333333333")
        
    }
    
    func testMissStr() {
        let res = OtherPractice.buddyStrings("abac", "abad")
        XCTAssertFalse(res)
        
        let res1 = OtherPractice.buddyStrings("ab", "ab")
        XCTAssertFalse(res1)
        
        let res2 = OtherPractice.buddyStrings("ab", "ba")
        XCTAssertTrue(res2)
        
        let res3 = OtherPractice.buddyStrings("aa", "aa")
        XCTAssertTrue(res3)
    }
}
