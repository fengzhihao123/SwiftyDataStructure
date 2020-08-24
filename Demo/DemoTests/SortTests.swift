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
        var arr = [4,4,6,5,3,2,8,1]
        Sort.quickSort(target: &arr)
        assert(arr == [1,2,3,4,4,5,6,8])
    }
    
    func testQuickSortRange() {
        var arr = [4,4,6,5,3,2,8,1]
        Sort.quickSort(target: &arr, start: 0, end: arr.count - 1)
        assert(arr == [1,2,3,4,4,5,6,8])
    }
    
    func testHeapSort() {
        var arr = [4,4,6,5,3,2,8,1]
        Sort.heapSort(target: &arr)
        assert(arr == [1,2,3,4,4,5,6,8])
    }
    
    func testCountSort() {
        let arr = [95, 94, 91, 98, 99, 90, 99, 93, 91, 92]
        let res = Sort.countSort(target: arr)
        assert(res == [90, 91, 91, 92, 93, 94, 95, 98, 99, 99])
    }
}
