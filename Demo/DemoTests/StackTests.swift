//
//  StackTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/25.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo

class StackTests: XCTestCase {
    func testMinStack() {
        var stack = MinStack<Int>()
        stack.push(-2)
        stack.push(0)
        stack.push(-3)
        
        XCTAssertTrue(stack.min() == -3)
        XCTAssertTrue(stack.pop() == -3)
        XCTAssertTrue(stack.top() == 0)
        XCTAssertTrue(stack.min() == -2)
    }
    
    func testQueueByStack() {
        var queue = QueueByStack<Int>()
        queue.push(1)
        queue.push(2)
        
        XCTAssertTrue(queue.top() == 1)
        XCTAssertTrue(queue.pop() == 1)
        XCTAssertFalse(queue.empty())
    }
    
    func testReverse() {
        var stack = [1, 2, 3]
        ReverseStack.reverse(stack: &stack)
        
        XCTAssertFalse(stack.isEmpty)
        XCTAssertFalse(stack == [1, 2, 3])
        XCTAssertTrue(stack == [3, 2, 1])
    }
}
