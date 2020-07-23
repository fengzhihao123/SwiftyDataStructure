//
//  Stack.swift
//  Demo
//
//  Created by Phil.Feng on 2020/7/22.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit
/// 栈（Stack）
public struct Stack<Element> {
    /// 栈元素数量 (Number of stack elements)
    public var count: Int { return _stackBuffer.count }
    /// 栈是否为空 (Is the stack empty)
    public var isEmpty: Bool { return _stackBuffer.count == 0 }
    /// 栈顶元素 (The top element of stack)
    public var top: Element { return _stackBuffer.top }
    
    private var _stackBuffer: StackBuffer<Element>!
    
    
    public init(capacity: Int) {
        _stackBuffer = StackBuffer(capacity: capacity)
    }
    
    /// 进栈 (Push)
    /// - Parameter newElement: 进栈元素 (The element of push)
    public func push(_ newElement: Element) {
        _stackBuffer.push(newElement)
    }
    
    /// 出栈 (Pop)
    /// - Returns: 出栈元素(The element of pop)
    public func pop() -> Element {
        return _stackBuffer.pop()
    }
}

extension Stack {
    private enum Alg: String {
        case add = "+"
        case subtraction = "-"
        case multiplication = "*"
        case division = "/"
    }
    
    static func reversePolish(notation: String) -> Int {
        //如果当前字符为变量或者为数字，则压栈，如果是运算符，则将栈顶两个元素弹出作相应运算，结果再入栈，最后当表达式扫描完后，栈里的就是结果。
        let operatorStack = Stack<Int>(capacity: notation.count)
        let elements = notation.components(separatedBy: " ")
        for ele in elements {
            if let num = Int(ele) {
                operatorStack.push(num)
            } else {
                guard let alg = Alg(rawValue: ele) else { fatalError("出现不支持字符") }
                let rightNum = operatorStack.pop()
                let leftNum = operatorStack.pop()
                switch alg {
                case .add:
                    operatorStack.push(leftNum + rightNum)
                case .subtraction:
                    operatorStack.push(leftNum - rightNum)
                case .multiplication:
                    operatorStack.push(leftNum * rightNum)
                case .division:
                    operatorStack.push(leftNum / rightNum)
                }
            }
        }
        
        return operatorStack.pop()
    }
    
}



/// 栈的底层结构(Storage buffer for a Stack)
class StackBuffer<Element> {
    var count = 0
    var top: Element { return _elements.advanced(by: count - 1).pointee }
    
    private var _capacity: Int
    private var _elements: UnsafeMutablePointer<Element>
    
    
    init(capacity: Int) {
        _capacity = capacity
        _elements = UnsafeMutablePointer.allocate(capacity: capacity)
    }
    
    deinit {
        _elements.advanced(by: 0).deinitialize(count: count)
        _elements.deallocate()
    }
    
    func push(_ newElement: Element) {
        precondition(count < _capacity, "[SwiftyDataStructure]: Capacity used up", file: "Stack.swift", line: #line)
        
        _elements.advanced(by: count).initialize(to: newElement)
        count += 1
    }
    
    func pop() -> Element {
        precondition(count > 0, "[SwiftyDataStructure]: Buffer is empty", file: "Stack.swift", line: #line)
        let last = _elements.advanced(by: count - 1).move()
        count -= 1
        return last
    }
}
