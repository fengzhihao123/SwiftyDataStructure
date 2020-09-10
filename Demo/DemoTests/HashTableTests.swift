//
//  HashTableTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/9/8.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo
class HashTableTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        var hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key1"] = 1
        hashTable["key2"] = 2
        hashTable["key3"] = 3
        XCTAssert(hashTable.value(forKey: "key1")! == 1)
        XCTAssert(hashTable.value(forKey: "key2")! == 2)
        hashTable["key1"] = 3
        XCTAssert(hashTable.value(forKey: "key1")! == 3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
