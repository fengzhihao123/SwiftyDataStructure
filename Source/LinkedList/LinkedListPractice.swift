//
//  LinkedListPractice.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/25.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

struct LinkedListPractice {
    /// 链表是否有环
    /// - Parameter head: 链表
    static func hasCycle(head: LinkNode<Int>?) -> Bool {
        guard head != nil else { return false }
        var fast = head
        var slow = head
        while true {
            guard fast != nil && fast?.next != nil else { return false }
            fast = fast?.next?.next
            slow = slow?.next
            if slow?.val == fast?.val {
                return true
            }
        }
        return false
    }
    
    /// 计算环的长度
    /// - Parameter head: 头结点
    static func cycleLength(head: LinkNode<Int>?) -> Int {
        guard head != nil else { return -1 }
        var slow = head
        var fast = head
        while true {
            guard fast != nil && fast?.next != nil else { return -1 }
            fast = fast?.next?.next
            slow = slow?.next
            if slow?.val == fast?.val {
                break
            }
        }
        
        guard slow?.val == fast?.val else { return -1 }
        
        var count = 1
        fast = fast?.next?.next
        slow = slow?.next
        while slow?.val != fast?.val {
            fast = fast?.next?.next
            slow = slow?.next
            count += 1
        }
        
        return count
    }
    
    /// 寻找环形链表的入口节点
    /// - Parameter head: 头结点
    static func cycleEntrance(head: LinkNode<Int>?) -> LinkNode<Int>? {
        guard head != nil else { return nil }
        var slow = head
        var fast = head
        while true {
            guard fast != nil && fast?.next != nil else { return nil }
            fast = fast?.next?.next
            slow = slow?.next
            if slow?.val == fast?.val {
                break
            }
        }
        
        guard slow?.val == fast?.val else { return nil }
        slow = head
        while slow?.val != fast?.val {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
}
