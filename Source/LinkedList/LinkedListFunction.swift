//
//  LinkedListFunction.swift
//  SwiftyDataStructure
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

/// 单链表和双链表的公共接口 ( Common interface of single linked list and double linked list )
protocol LinkedListFunction {
    associatedtype E: Equatable
    /// 在链表头部添加节点 ( Add a node to the head of the linked list )
    /// - Parameter newElement: 添加的节点
    func append(atHead newElement: E)
    
    /// 在链表尾部添加节点 ( Add node at the end of the list )
    /// - Parameter newElement: 添加的节点
    func append(atTail newElement: E)
    
    /// 插入节点 ( Insert node )
    /// - Parameters:
    ///   - newElement: 添加的节点
    ///   - i: 添加的位置
    func insert(_ newElement: E, at i: Int)

    
    /// 移除节点 ( Remove node )
    /// - Parameter index: 移除的位置
    /// - Returns: 被移除的节点
    func remove(at index: Int) -> E?
    
    /// 移除头部节点 ( Remove head node )
    /// - Returns: 被移除的节点
    func removeFirst() -> E?
    
    /// 移除尾部节点  ( Remove tail node )
    /// - Returns: 被移除的节点
    func removeLast() -> E?

    /// 移除所有节点
    func removeAll()
    
    
    /// 更新节点 ( Update node )
    /// - Parameters:
    ///   - index: 更新节点的位置
    ///   - newElement: 新节点
    func update(at index: Int, _ newElement: E)
    
    
    /// 获取节点值 
    /// - Parameter index: 获取位置
    /// - Returns: 当前 index 的节点值
    func index(of index: Int) -> E?
    
    /// 是否包含 element
    /// - Parameter element: 需要查找的 element
    /// - Returns: 如果链表中包含该元素，返回 true，反之则返回 false
    func contains(_ element: E) -> Bool

    /// 获取链表所有元素 (Get all the elements of the linked list)
    /// - Returns: 返回包含链表所有元素的数组
    func getAllElements() -> [E]
}
