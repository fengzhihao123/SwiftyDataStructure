//
//  SingleLinkedListTest.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

struct SingleLinkedListTest {
    static func test() {
        self.testAppend()
        self.testRemove()
        self.testUpdate()
        self.testContains()
    }
    
    static func testAppend() {
        let linkedList = SingleLinkedList<Int>()
        linkedList.append(atHead: 1)
        assert(linkedList.count == 1, "append(atHead newElement: Int) error")
        
        linkedList.append(atTail: 3)
        assert(linkedList.count == 2, "append(atTail newElement: Int) error")
        
        linkedList.insert(2, at: 1)
        assert(linkedList.count == 3, "insert(_ newElement: Int, at i: Int) error")
        
        let res1 = linkedList.index(of: 1)!
        assert(res1 == 2, "index(of index: Int) error")
    }
    
    static func testRemove() {
        let linkedList = SingleLinkedList<Int>()
        linkedList.append(atHead: 1)
        linkedList.append(atTail: 3)
        linkedList.insert(2, at: 1)
        
        linkedList.removeLast()
        assert(linkedList.linkedListPrint() == [1, 2])
        
        linkedList.removeLast()
        assert(linkedList.linkedListPrint() == [1])
        
        linkedList.removeLast()
        assert(linkedList.linkedListPrint() == [])
        
        linkedList.append(atHead: 1)
        linkedList.append(atTail: 3)
        linkedList.insert(2, at: 1)
        
        linkedList.removeFirst()
        assert(linkedList.linkedListPrint() == [2, 3])
        
        linkedList.removeFirst()
        assert(linkedList.linkedListPrint() == [3])
        
        linkedList.removeFirst()
        assert(linkedList.linkedListPrint() == [])
        
        
        linkedList.append(atHead: 1)
        linkedList.append(atTail: 3)
        linkedList.insert(2, at: 1)
        
        linkedList.remove(at: 1)
        assert(linkedList.linkedListPrint() == [1, 3])
        
        linkedList.remove(at: 2)
        assert(linkedList.linkedListPrint() == [1, 3])
        
        linkedList.remove(at: 1)
        assert(linkedList.linkedListPrint() == [1])
        
        linkedList.remove(at: 0)
        assert(linkedList.linkedListPrint() == [])
    }
    
    static func testUpdate() {
        let linkedList = SingleLinkedList<Int>()
        linkedList.append(atHead: 1)
        linkedList.append(atTail: 3)
        linkedList.insert(2, at: 1)
        
        linkedList.update(at: 1, 5)
        assert(linkedList.index(of: 1)! == 5, "update(at index: Int, _ newElement: E) error")
    }
    
    static func testContains() {
        let linkedList = SingleLinkedList<Int>()
        linkedList.append(atHead: 1)
        linkedList.append(atTail: 3)
        linkedList.insert(2, at: 1)
        
        assert(linkedList.contains(3))
        assert(linkedList.contains(1))
        assert(linkedList.contains(2))
    }
}
