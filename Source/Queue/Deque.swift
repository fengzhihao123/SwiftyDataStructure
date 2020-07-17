//
//  Deque.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

/// 双端队列
public struct Deque<E: Equatable> {
    private var _linkedList = DoubleLinkedList<E>()
    /// 队列数量
    private let capacity: Int!
    /// 队列是否为空
    public var isEmpty: Bool { return _linkedList.count == 0 }
    /// 队头
    public var first: E? { return _linkedList.head?.val }
    /// 队尾
    public var last: E? { return _linkedList.tail?.val }
    /// 元素的数量
    public var count: Int { return _linkedList.count }
    

    public init(capacity: Int) {
        self.capacity = capacity
    }
    
    /// 队头入队
    /// - Parameter newElement: 入队的元素
    public mutating func enQueueFront(_ newElement: E) -> Bool {
        guard _linkedList.count < capacity else { return false }
        _linkedList.append(atHead: newElement)
        return true
    }
    
    /// 队尾入队
    /// - Parameter newElement: 入队的元素
    public mutating func enQueueRear(_ newElement: E) -> Bool {
        guard _linkedList.count < capacity else { return false }
        _linkedList.append(atTail: newElement)
        return true
    }
    
    /// 队头出队
    /// - Returns: 出队的元素
    @discardableResult
    public mutating func deQueueFront() -> E? {
        guard !isEmpty else { return nil }
        let old = _linkedList.removeFirst()
        return old
    }
    
    /// 队尾出队
    /// - Returns: 出队的元素
    @discardableResult
    public mutating func deQueueRear() -> E? {
        guard !isEmpty else { return nil }
        let old = _linkedList.removeLast()
        return old
    }
}
