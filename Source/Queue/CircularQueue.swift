//
//  CircularQueue.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

/// 循环队列
public struct CircularQueue<E> {
    private var _contents: [E?]!
    private var _front = 0
    private var _rear = -1
    private var _count = 0
    
    public var first: E? { return _first() }
    public var last: E? { return _last() }
    public var isEmpty: Bool { return _count == 0 }
    public var isFull: Bool { return _count == _contents.count}
    
    
    public init(_ k: Int) {
        _contents = Array(repeating: nil, count: k)
    }
    
    /// 入队
    /// - Parameter newElement: 入队元素
    @discardableResult
    public mutating func enQueue(_ newElement: E) -> Bool {
        guard !isFull else { return false }
        _rear = _index(_rear)
        _contents[_rear] = newElement
        _count += 1
        return true
    }
    
    /// 出队
    @discardableResult
    public mutating func deQueue() -> Bool {
        guard !isEmpty else { return false }
        
        _contents[_front] = nil
        _count -= 1
        _front = _index(_front)
        return true
    }
    
    private func _first() -> E? {
        return _contents[_front]
    }
    
    private func _last() -> E? {
        return _contents[_rear]
    }
    
    /// 映射索引
    /// - Parameter curIndex: 需要映射的索引
    /// - Returns: 返回真实索引
    private func _index(_ curIndex: Int) -> Int {
        if curIndex < 0 {
            return 0
        }
        
        let realIndex = curIndex + 1
        return realIndex < _contents.count ? realIndex : _contents.count - realIndex
    }
}
