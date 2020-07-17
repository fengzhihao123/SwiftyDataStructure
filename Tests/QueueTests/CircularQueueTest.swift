//
//  CircularQueueTest.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

struct CircularQueueTest {
    static func test() {
        var queue = CircularQueue<Int>(3)
        assert(queue.enQueue(1))
        assert(queue.enQueue(2))
        assert(queue.enQueue(3))
        assert(!queue.enQueue(4))
      
        assert(queue.last! == 3)
        assert(queue.isFull)
        
        assert(queue.deQueue())
        assert(queue.enQueue(4))
        
        assert(queue.last! == 4)
        
        assert(queue.first! == 2)
        assert(queue.isFull)
        assert(!queue.isEmpty)
        queue.deQueue()
        queue.deQueue()
        queue.deQueue()
        assert(queue.isEmpty)
    }
}
