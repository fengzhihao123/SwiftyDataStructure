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
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable.setValue(value: 1, forKey: "key1")
        hashTable.setValue(value: 2, forKey: "key2")
        hashTable.setValue(value: 3, forKey: "key3")
        XCTAssert(hashTable.object(forKey: "key1") == 1)
        XCTAssert(hashTable.object(forKey: "key2") == 2)
        hashTable.setValue(value: 3, forKey: "key1")
        XCTAssert(hashTable.object(forKey: "key1") == 3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
