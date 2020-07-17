//
//  Queue.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

public struct Queue<E> {
    private var _queue: [E?]!
    /// 队列数量
    private(set) var count = 0
    private var _front = 0
    
    /// 队列是否为空
    public var isEmpty: Bool { return count == 0 }
    /// 队头
    public var first: E? { return _queue[_front] }
    
    
    public init(capacity: Int) {
        _queue = Array(repeating: nil, count: capacity)
    }
    
    /// 入队
    /// - Parameter newElement: 入队的元素
    public mutating func enQueue(_ newElement: E) -> Bool {
        guard count < _queue.count else { return false }
        let index = _front + count
        _queue[index] = newElement
        count += 1
        return true
    }
    
    /// 出队
    /// - Returns: 出队的元素
    @discardableResult
    public mutating func deQueue() -> E? {
        guard !isEmpty else { return nil }
        let old = _queue[_front]
        _front += 1
        count -= 1
        return old
    }
}
