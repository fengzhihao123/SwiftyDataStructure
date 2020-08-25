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
        var fast = head?.next
        var slow = head
        while slow != nil && slow?.next != nil {
            if fast?.val == slow?.val {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}
