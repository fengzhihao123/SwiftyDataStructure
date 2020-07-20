//
//  Queue.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

public struct Queue<Element> {
    /// 队列是否为空 (Is the queue empty)
    public var isEmpty: Bool { return _queueBuffer.count == 0 }
    /// 队列是否已满 (Is the queue full)
    public var isFull: Bool { return _queueBuffer.isFull }
    /// 队头 (The first element of queue)
    public var first: Element? { return _queueBuffer.first }
    /// 队列元素数量 (Number of queue elements)
    public var count: Int { return _queueBuffer.count }
    /// 队列底层结构实现 (The buffer  of queue)
    private var _queueBuffer: QueueBuffer<Element>!
    private var _capacity: Int
    
    
    public init(capacity: Int) {
        _capacity = capacity
        _queueBuffer = QueueBuffer(capacity: capacity)
    }
    
    /// 入队 (Enter Queue)
    /// - Parameter newElement: 入队的元素 （The Element of enter queue）
    public mutating func append(_ newElement: Element) {
        // 自动扩容，复杂度O(n) (Automatic expansion, Complexity: O(n))
        if _queueBuffer.isFull {
            // 相当于(Equal)：_capacity = _capacity * 1.5
            _capacity = _capacity + _capacity >> 1
            _queueBuffer = _queueBuffer.realloc(capacity: _capacity)
        }
        _queueBuffer.append(newElement)
    }
    
    /// 出队 (Dequeue)
    /// - Returns: 出队的元素 （The Element of dequeue）
    @discardableResult
    public mutating func popFirst() -> Element? {
        return _queueBuffer.popFirst()
    }
}



/// 队列底部结构 (Storage buffer for a deque)
final class QueueBuffer<Element> {
    
    /// buffer 的容量 (The capacity of this storage buffer)
    let capacity: Int
    /// buffer 的第一个元素 (The first element of buffer)
    var first: Element? { return elements.advanced(by: start).pointee }
    /// buffer 是否达到最大容量 (Buffer is full)
    var isFull: Bool { return count == capacity }
    /// buffer 的元素数量 (The number of items currently in this deque)
    fileprivate(set) var count: Int
    /// buffer 的起始位置 (The index of the first item)
    fileprivate(set) var start: Int
    /// 指向分配内存空间的指针 (Pointer to allocated storage)
    fileprivate(set) var elements: UnsafeMutablePointer<Element>
    
    
    init(capacity: Int) {
        self.elements = UnsafeMutablePointer.allocate(capacity: capacity)
        self.capacity = capacity
        self.count = 0
        self.start = 0
    }
    
    convenience init(repeating repeatedValue: Element, count: Int) {
        self.init(capacity: count)
        
        let pointerOfElements = elements
        self.count = count
        var curPointerOfElements = pointerOfElements
        let end = pointerOfElements + count
        while curPointerOfElements != end {
            curPointerOfElements.initialize(to: repeatedValue)
            curPointerOfElements += 1
        }
    }
    
    deinit {
        elements.advanced(by: start).deinitialize(count: count)
        elements.deallocate()
    }
    
    func realloc(capacity newCapacity: Int) -> QueueBuffer {
        if newCapacity <= self.capacity {
            return self
        }
        let buffer = QueueBuffer(capacity: newCapacity)
        buffer.count = self.count
        let newBufferElements = buffer.elements
        let oldBufferElements = self.elements
        newBufferElements.moveInitialize(from: oldBufferElements.advanced(by: start), count: count)
        count = 0
        return buffer
    }
    
    func popFirst() -> Element? {
        precondition(count > 0, "[SwiftyDataStructure]: Buffer is empty", file: "Queue.swift", line: #line)
        
        let first = elements.advanced(by: start).move()
        start += 1
        count -= 1
        return first
    }
    
    func append(_ newElement: Element) {
        precondition(count < capacity, "[SwiftyDataStructure]: Capacity used up", file: "Queue.swift", line: #line)
        
        elements.advanced(by: count).initialize(to: newElement)
        count += 1
    }
}

extension QueueBuffer {
    subscript(index: Int) -> Element {
        set {
            assert(index < 0 || index >= count)
            elements.advanced(by: index).pointee = newValue
        }
        get {
            assert(index < 0 || index >= count)
            return elements.advanced(by: index).pointee
        }
    }
}
