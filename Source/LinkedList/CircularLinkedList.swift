//
//  CircularLinkedList.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

/// 循环链表
public class CircularLinkedList<E: Equatable> {
    /// 链表的头结点
    public var head: LinkNode<E>?
    /// 链表的尾结点
    public var tail: LinkNode<E>?
    
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
        var curIndex = 0
        while curIndex < count {
            curNode = curNode?.next
            curIndex += 1
            if curIndex == index {
                break
            }
        }
        
        return curNode
    }
}

extension CircularLinkedList: LinkedListFunction {
    public func append(atHead newElement: E) {
        if head == nil {
            head = LinkNode(val: newElement)
            tail = head
            tail?.next = tail
        } else {
            let newHead = LinkNode(val: newElement)
            newHead.next = head
            head = newHead
            tail?.next = head
        }
        count += 1
    }
    
    public func append(atTail newElement: E) {
        if tail != nil {
            let next = tail?.next
            if count == 1 {
                tail = LinkNode(val: newElement)
                tail?.next = next
                head?.next = tail
            } else {
                tail = LinkNode(val: newElement)
                tail?.next = next
            }
        } else {
            tail = LinkNode(val: newElement)
            tail?.next = tail
            head = tail
        }
        count += 1
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
            tail = nil
        } else {
            head = head?.next
            tail?.next = head
        }
        count -= 1
        return val
    }
    
    @discardableResult
    public func removeLast() -> E? {
        guard head != nil else { return nil }
        let val: E?
        
        if count == 1 {
            val = head?.val
            head = nil
            tail = nil
        } else {
            let prevTail = _node(count - 2)
            val = prevTail?.next?.val
            prevTail?.next = prevTail?.next?.next
        }
        count -= 1
        return val
    }

    public func removeAll() {
        count = 0
        head = nil
        tail = nil
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
    
    public func getAllElements() -> [E] {
        guard count > 0 else { return [] }
        var nodes = [E]()
        var curNode = head
        while curNode?.next?.val != head?.val {
            nodes.append(curNode!.val)
            curNode = curNode?.next
        }
        
        nodes.append(curNode!.val)
        return nodes
    }
}
