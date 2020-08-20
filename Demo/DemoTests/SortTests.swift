//
//  SortTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/19.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo

class SortTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBubbleSort() {
        let arr = [4,4,6,5,3,2,8,1]
        let result = Sort.bubbleSort(target: arr)
        XCTAssert(result == [1,2,3,4,4,5,6,8])
    }
    
    func testQuickSort() {
        let arr = [4,4,6,5,3,2,8,1]
        let result = Sort.quickSort(target: arr)
        assert(result == [1,2,3,4,4,5,6,8])
    }
    
    func testQuickSortRange() {
        var arr = [4,4,6,5,3,2,8,1]
        Sort.quickSort(target: &arr, start: 0, end: arr.count - 1)
        assert(arr == [1,2,3,4,4,5,6,8])
    }
}
