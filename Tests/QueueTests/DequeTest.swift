//
//  DequeTest.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

struct DequeTest {
    static func test() {
        var deque = Deque<Int>(capacity: 3)
        assert(deque.enQueueRear(1))
        assert(deque.enQueueRear(2))
        assert(deque.enQueueRear(3))
        
        assert(!deque.isEmpty)
        
        assert(deque.first! == 1)
        assert(deque.last! == 3)
        assert(deque.count == 3)
        
        assert(!deque.enQueueFront(4))
        assert(deque.deQueueFront()! == 1)
        assert(deque.deQueueFront()! == 2)
        
        assert(deque.enQueueFront(4))
        assert(deque.first! == 4)
        assert(deque.enQueueFront(5))
        assert(deque.first! == 5)
        
        assert(deque.deQueueRear()! == 3)
        assert(deque.deQueueRear()! == 4)
        assert(deque.deQueueRear()! == 5)
        
        assert(deque.isEmpty)
    }
}
