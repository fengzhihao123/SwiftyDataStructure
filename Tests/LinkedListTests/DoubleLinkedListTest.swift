//
//  DoubleLinkedListTest.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

struct DoubleLinkedListTest {
    static func test() {
        let linkedList = DoubleLinkedList<Int>()
        linkedList.append(atHead: 1)
        assert(linkedList.count == 1 && linkedList.index(of: 0) == 1, "append(atHead newElement: Int) error")
        
        linkedList.append(atTail: 3)
        assert(linkedList.count == 2 && linkedList.index(of: 1) == 3, "append(atTail newElement: Int) error")
        
        linkedList.insert(2, at: 1)
        assert(linkedList.count == 3 && linkedList.index(of: 1) == 2, "insert(_ newElement: Int, at i: Int) error")
        
        let res1 = linkedList.index(of: 1)!
        assert(res1 == 2, "index(of index: Int) error")
        
        linkedList.remove(at: 1)
        let res2 = linkedList.index(of: 1)!
        assert(res2 == 3, "remove(at index: Int) error")
        
        linkedList.update(at: 1, 4)
        let res3 = linkedList.index(of: 1)!
        
        assert(res3 == 4, "update(at index: Int, _ newElement: Int) error")
        
        assert(linkedList.count == 2)
        
        assert(linkedList.contains(1), "contains(_ element: E) -> Bool error")

        linkedList.removeAll()
        assert(linkedList.count == 0)
    }
}
