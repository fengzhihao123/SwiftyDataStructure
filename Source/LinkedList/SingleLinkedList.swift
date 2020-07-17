//
//  SingleLinkedList.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

/// 单链表的节点
public class LinkNode<E: Equatable> {
    var val: E
    var next: LinkNode?
    public init(val: E) {
        self.val = val
    }
    
    static func == (lhs: LinkNode, rhs: LinkNode) -> Bool {
        return lhs.val == rhs.val
    }
}

public class SingleLinkedList<E: Equatable> {
    /// 链表的头结点
    public var head: LinkNode<E>?
    /// 链表的长度
    private(set) var count = 0
    
    
    /// 内部获取节点的方法
    /// - Parameter index: 获取位置
    /// - Returns: 当前 index 的节点
    private func _node(_ index: Int) -> LinkNode<E>? {
        guard index < count else {
            return nil
        }
        
        if index == 0 { return head }
        var curNode = head
        var curIndex = index
        
        while curIndex > 0 {
            curNode = curNode?.next
            curIndex -= 1
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

extension SingleLinkedList: LinkedListFunction {
    public func append(atHead newElement: E) {
        if head == nil {
            head = LinkNode(val: newElement)
        } else {
            let newHead = LinkNode(val: newElement)
            newHead.next = head
            head = newHead
        }
        count += 1
    }
    
    public func append(atTail newElement: E) {
        if let tail = _node(count - 1) {
            tail.next = LinkNode(val: newElement)
            count += 1
        }
    }
    
    
    public func insert(_ newElement: E, at i: Int) {
        guard i <= count else { return }
        
        if i == 0 {
            append(atHead: newElement)
        } else if i == count {
            append(atTail: newElement)
        } else {
            if let curNode = _node(i - 1) {
                let insertNode = LinkNode(val: newElement)
                insertNode.next = curNode.next
                curNode.next = insertNode
                count += 1
            }
        }
    }

    
    @discardableResult
    public func remove(at index: Int) -> E? {
        guard head != nil else { return nil }
        guard index < count else { return nil }
        
        if index == 0 {
            return removeFirst()
        } else if index == count - 1 {
            return removeLast()
        } else {
            let prevTail = _node(index - 1)
            let val = prevTail?.next?.val
            prevTail?.next = prevTail?.next?.next
            
            count -= 1
            return val
        }
    }
    
    @discardableResult
    public func removeFirst() -> E? {
        let val = head?.val
        if count == 1 {
            head = nil
        } else {
            head = head?.next
        }
        count -= 1
        return val
    }
    
    @discardableResult
    public func removeLast() -> E? {
        guard head != nil else { return nil }
        
        if count == 1 {
            let val = head?.val
            head = nil
            
            count -= 1
            return val
        } else {
            let prevTail = _node(count - 2)
            let val = prevTail?.next?.val
            prevTail?.next = prevTail?.next?.next
            
            count -= 1
            return val
        }
    }

    public func removeAll() {
        count = 0
        head = nil
    }
    
    
    public func update(at index: Int, _ newElement: E) {
        guard let curNode = _node(index) else { fatalError("Index out of range") }
        curNode.val = newElement
    }
    
    
    @discardableResult
    public func index(of index: Int) -> E? {
        return _node(index)?.val
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
