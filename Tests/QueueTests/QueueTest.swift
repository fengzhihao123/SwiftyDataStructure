//
//  QueueTest.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

struct QueueTest {
    static func test() {
        var queue = Queue<Int>(capacity: 10)
        queue.append(10)
        queue.append(20)
        queue.append(30)
        queue.append(40)
        queue.append(50)
        queue.append(60)
        queue.append(70)
        queue.append(80)
        queue.append(90)
        queue.append(100)
        
        queue.append(110)
        queue.append(120)
        
        assert(queue.first! == 10)
        assert(queue.popFirst()! == 10)
        assert(queue.first! == 20)
        assert(queue.count == 11)
        assert(!queue.isEmpty)

        assert(queue.popFirst()! == 20)
        assert(queue.popFirst()! == 30)
        assert(queue.popFirst()! == 40)
        assert(queue.popFirst()! == 50)
        assert(queue.popFirst()! == 60)
        assert(queue.popFirst()! == 70)
        assert(queue.popFirst()! == 80)
        assert(queue.popFirst()! == 90)
        assert(queue.popFirst()! == 100)
        assert(queue.popFirst()! == 110)
        assert(queue.popFirst()! == 120)

        assert(queue.isEmpty)
    }
}

