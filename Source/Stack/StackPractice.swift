//
//  StackPractice.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/25.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

struct MinStack<E: Comparable> {
    private var _contentStack: [E]
    private var _minStack: [E]
    
    init() {
        _contentStack = []
        _minStack = []
    }
    
    public mutating func push(_ newElement: E) {
        _contentStack.append(newElement)
        if _minStack.isEmpty || newElement <= _minStack.last! {
            _minStack.append(newElement)
        }
    }
    
    public mutating func pop() -> E {
        guard let last = _contentStack.popLast() else { fatalError("_contentStack 不应为空") }
        if last <= _minStack.last! {
            let _ = _minStack.popLast()
        }
        return last
    }
    
    public func top() -> E {
        guard let last = _contentStack.last else { fatalError("_contentStack 不应为空") }
        return last
    }
    
    public func min() -> E {
        guard let min = _minStack.last else { fatalError("_minStack 不应为空") }
        return min
    }
}

struct QueueByStack<E> {
    private var _pushStack: [E]
    private var _popStack: [E]
    
    init() {
        _pushStack = []
        _popStack = []
    }
    
    public mutating func push(_ newElement: E) {
        _pushStack.append(newElement)
        pushToPop()
    }
    
    public mutating func pop() -> E {
        let last = _popStack.popLast()!
        pushToPop()
        return last
    }
    
    public func top() -> E {
        return _popStack.last!
    }
    
    public func empty() -> Bool {
        return _pushStack.isEmpty && _popStack.isEmpty
    }
    
    private mutating func pushToPop() {
        guard _popStack.isEmpty else { return }
        while !_pushStack.isEmpty {
            _popStack.append(_pushStack.popLast()!)
        }
    }
}
