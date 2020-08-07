//
//  BSTree.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/7.
//  Copyright © 2020 Phil.Feng. All rights reserved.
// [Source Code](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Tree)

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
      switch self {
      case let .node(left, value, right):
        return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
      case .empty:
        return ""
      }
    }
}

extension BinaryTree {
    /// 前序遍历
    /// - Parameter process: process
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    /// 中序遍历
    /// - Parameter process: process
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    /// 后序遍历
    /// - Parameter process: process
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    /// 层序遍历
    /// - Parameter process: process
    public func traverseLevelOrder(process: (T) -> Void) {
        var queue = [BinaryTree]()
        queue.append(self)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if case let .node(left, value, right) = node {
                process(value)
                if case .node(_, _, _) = left { queue.append(left) }
                if case .node(_, _, _) = right { queue.append(right) }
            }
        }
    }
}
