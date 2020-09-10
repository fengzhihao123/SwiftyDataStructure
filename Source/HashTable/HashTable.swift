//
//  HashTable.swift
//  Demo
//
//  Created by Phil.Feng on 2020/9/8.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

class HashTable<Key: Hashable, Element> {
    private var _buffer: HashTableBuffer<Key, Element>!
    
    init(capacity: Int) {
        _buffer = HashTableBuffer(capacity: capacity)
    }
    
    func setValue(value: Element, forKey key: Key) {
        _buffer.setValue(value: value, forKey: key)
    }
    
    func object(forKey key: Key) -> Element {
        guard let element = _buffer.object(forKey: key) else {
            fatalError("element shouldn't be null")
        }
        return element
    }
    
    func containsKey() {
        
    }
    
    func containValue() {
        
    }
    
    func remove() {
        
    }
    
    func removeAll() {
        _buffer.removeAll()
    }
    
    func keys() -> [Key] {
        let result = _buffer._keys.compactMap { $0 }
        return result
    }
    
    func values() {
    
    }
}

final class HashTableBuffer<Key: Hashable, Element> {
    var count = 0
    private var _capacity: Int
    private var _elements: [Element?]
    private(set) var _keys: [Key?]
    
    init(capacity: Int) {
        _capacity = capacity
        _elements = Array(repeating: nil, count: capacity)
        _keys = Array(repeating: nil, count: capacity)
    }
    
    func setValue(value: Element, forKey key: Key) {
        let idx = key.hashValue % _capacity
        let positiveIdx = Int(idx.magnitude)
        if let storedKey = _keys[positiveIdx] {
            if storedKey == key {
                _elements[positiveIdx] = value
            } else { // 哈希碰撞
                // 1. 开放寻址法
                // 2. 链表法
                
                
                
            }
        } else {
            _keys[positiveIdx] = key
            _elements[positiveIdx] = value
        }
    }
    
    func object(forKey key: Key) -> Element? {
        let idx = key.hashValue % _capacity
        let positiveIdx = Int(idx.magnitude)
        return _elements[positiveIdx]
    }
    
    func removeAll() {
        _keys.removeAll()
        _elements.removeAll()
    }
}
