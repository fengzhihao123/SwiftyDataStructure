//
//  DoubleLinkNode.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

/// 双链表的节点
public class DoubleLinkNode<E: Equatable> {
    var val: E
    var next: DoubleLinkNode?
    var prev: DoubleLinkNode?
    
    init(prev: DoubleLinkNode?, val: E, next: DoubleLinkNode?) {
        self.prev = prev
        self.val = val
        self.next = next
    }
    
    static func == (lhs: DoubleLinkNode, rhs: DoubleLinkNode) -> Bool {
        return lhs.val == rhs.val
    }
}

public class DoubleLinkedList<E: Equatable> {
    public var head: DoubleLinkNode<E>?
    public var tail: DoubleLinkNode<E>?
    private(set) var count = 0
    
    /// 内部获取节点的方法
    /// - Parameter index: 获取位置
    /// - Returns: 当前 index 的节点
    private func _node(_ index: Int) -> DoubleLinkNode<E>? {
        guard index < count else {
            return nil
        }
        
        if index == 0 { return head }
        if index == count - 1 { return tail }
        var curNode: DoubleLinkNode<E>?
        var curIndex = index
        if index < count/2 { // 前半段
            curNode = head
            while curIndex > 0 {
                curNode = curNode?.next
                curIndex -= 1
            }
            
        } else { // 后半段
            curNode = tail
            curIndex = count - 1
            
            while curIndex > index {
                curNode = curNode?.prev
                curIndex -= 1
            }
        }
        return curNode
    }
    
    /// 打印链表当前元素 - 方便调试
    func linkedListPrint() -> [E] {
        var nodes = [E]()
        var curNode = head
        while curNode != nil {
            nodes.append(curNode!.val)
            curNode = curNode?.next
        }
        
        return nodes
    }
    
}

extension DoubleLinkedList: LinkedListFunction {
    public func append(atHead newElement: E) {
        if head == nil {
            head = DoubleLinkNode(prev: nil, val: newElement, next: nil)
            tail = head
        } else {
            let newHead = DoubleLinkNode(prev: nil, val: newElement, next: head)
            head?.prev = newHead
            head = newHead
        }
        count += 1
    }
    
    public func append(atTail newElement: E) {
        if tail == nil {
            tail = DoubleLinkNode(prev: nil, val: newElement, next: nil)
            head = tail
        } else {
            let newTail = DoubleLinkNode(prev: tail, val: newElement, next: nil)
            if tail?.prev == nil {
                head?.next = newTail
            } else {
                tail?.next = newTail
            }
            tail = newTail
        }
        
        count += 1
    }
    
    public func insert(_ newElement: E, at i: Int) {
        guard i < count else { return }
        
        if i == 0 {
            append(atHead: newElement)
        } else if i == count {
            append(atTail: newElement)
        } else {
            if let curNode = _node(i - 1) {
                let insertNode = DoubleLinkNode(prev: curNode, val: newElement, next: curNode.next)
                
                curNode.next?.prev = insertNode
                curNode.next = insertNode
                count += 1
            }
        }
    }
    
    @discardableResult
    public func remove(at index: Int) -> E? {
        guard head != nil else { return nil }
        
        if index == 0 {
            return removeFirst()
        } else if index == count {
            return removeLast()
        } else {
            count -= 1
            let node = _node(index)
            let old = node
            node?.prev?.next = node?.next
            node?.next?.prev = node?.prev
            return old?.val
        }
    }
    
    public func removeFirst() -> E? {
        guard head != nil else {
            return nil
        }
        
        count -= 1
        
        let old = head
        head = head?.next
        head?.prev = nil
        return old?.val
    }
    
    public func removeLast() -> E? {
        guard tail != nil else {
            return nil
        }
        
        count -= 1
        
        let old = tail
        tail = tail?.prev
        tail?.next = nil
        return old?.val
    }
    
    public func removeAll() {
        head = nil
        tail = nil
        count = 0
        #warning("TODO: 循环删除别的元素")
    }
    
    public func update(at index: Int, _ newElement: E) {
        guard let curNode = _node(index) else { fatalError("Index out of range") }
        curNode.val = newElement
    }
    
    public func index(of index: Int) -> E? {
        if index == 0 {
            return head?.val
        } else if index == count - 1 {
            return tail?.val
        } else {
            return _node(index)?.val
        }
    }
    
    public func contains(_ element: E) -> Bool {
        guard head != nil else { return false }
        
        var curNode = head
        while curNode != nil {
            if curNode!.val == element {
                return true
            }
            curNode = curNode?.next
        }
        return false
    }
}
