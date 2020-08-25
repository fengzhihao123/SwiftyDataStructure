//
//  LinkedListTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/25.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo
class LinkedListTests: XCTestCase {

    func testHasCycle() {
        let node1 = LinkNode(val: 5)
        let node2 = LinkNode(val: 3)
        let node3 = LinkNode(val: 7)
        let node4 = LinkNode(val: 2)
        let node5 = LinkNode(val: 6)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        XCTAssertFalse(LinkedListPractice.hasCycle(head: node1))
        
        node5.next = node2
        XCTAssertTrue(LinkedListPractice.hasCycle(head: node1))
    }

}
