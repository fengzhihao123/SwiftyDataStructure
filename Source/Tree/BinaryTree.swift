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
        var queue = [self]
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

extension BinaryTree {
    /// 二叉树的最大深度 - 通过递归实现
    /// - Parameter root: 树的根节点
    public func maxDepth(root: BinaryTree) -> Int {
        if case let .node(left, _, right) = root {
            return max(maxDepth(root: left), maxDepth(root: right)) + 1
        }
        return 0
    }
    
    /// 二叉树的最大深度 - 通过队列实现
    public func maxDepth() -> Int {
        var queue = [self]
        var result = 0
        while !queue.isEmpty {
            var temp = [BinaryTree]()
            for node in queue {
                if case let .node(left, _, right) = node {
                    if case .node(_, _, _) = left { temp.append(left) }
                    if case .node(_, _, _) = right { temp.append(right) }
                }
            }
            result += 1
            queue = temp
        }
        return result
    }
}
