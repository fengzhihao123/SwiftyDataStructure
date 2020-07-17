//
//  QueueTest.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

struct QueueTest {
    static func test() {
        var queue = Queue<Int>(capacity: 3)
        assert(queue.enQueue(10))
        assert(queue.enQueue(20))
        assert(queue.enQueue(30))
        
        assert(!queue.enQueue(40))
        
        assert(queue.first! == 10)
        assert(queue.deQueue()! == 10)
        assert(queue.first! == 20)
        assert(queue.count == 2)
        assert(!queue.isEmpty)
        
        assert(queue.deQueue()! == 20)
        assert(queue.deQueue()! == 30)
        
        assert(queue.isEmpty)
    }
}

