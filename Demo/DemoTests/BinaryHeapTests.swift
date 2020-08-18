//
//  BinaryHeapTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo

class BinaryHeapTests: XCTestCase {
    var binaryheap: BinaryHeap!
    
    override func setUp() {
        binaryheap = BinaryHeap()
    }

    override func tearDown() {
        binaryheap = nil
    }
    
    func testBuildMinHeap() {
        var arr = [1,3,2,6,5,7,8,9,10,0]
        binaryheap.buildMinHeap(heap: &arr)
        XCTAssert(arr == [0, 1, 2, 6, 3, 7, 8, 9, 10, 5])
    }
    
    func testMinFloating() {
        var arr = [1, 2, 3, 4, 5, 0]
        binaryheap.minFloating(heap: &arr)
        XCTAssert(arr == [0, 2, 1, 4, 5, 3])
    }
    
    func testMaxFloating() {
        var arr = [5, 4, 3, 2, 1, 6]
        binaryheap.maxFloating(heap: &arr)
        XCTAssert(arr == [6, 4, 5, 2, 1, 3])
    }
    
    func testBuildMaxHeap() {
        var arr = [10, 9, 8, 7, 6, 11]
        binaryheap.buildMaxHeap(heap: &arr)
        XCTAssert(arr == [11, 9, 10, 7, 6, 8])
    }
}
