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
    var head: LinkNode<Int>?
    
    override func setUp() {
        let node1 = LinkNode(val: 5)
        let node2 = LinkNode(val: 3)
        let node3 = LinkNode(val: 7)
        let node4 = LinkNode(val: 2)
        let node5 = LinkNode(val: 6)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        head = node1
    }
    
    func testHasCycle() {
        XCTAssertFalse(LinkedListPractice.hasCycle(head: head))
        head?.next?.next?.next?.next?.next = head?.next?.next
        XCTAssertTrue(LinkedListPractice.hasCycle(head: head))
    }
    
    func testCycleLength() {
        XCTAssertFalse(LinkedListPractice.cycleLength(head: head) > 0)
        head?.next?.next?.next?.next?.next = head?.next?.next
        XCTAssertTrue(LinkedListPractice.cycleLength(head: head) == 3)
    }

    func testCycleEntrance() {
        XCTAssertFalse(LinkedListPractice.cycleEntrance(head: head) != nil)
        head?.next?.next?.next?.next?.next = head?.next?.next
        XCTAssertTrue(LinkedListPractice.cycleEntrance(head: head)!.val == 7)
    }
}
