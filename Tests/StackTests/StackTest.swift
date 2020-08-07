//
//  StackTest.swift
//  Demo
//
//  Created by Phil.Feng on 2020/7/22.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

struct StackTest {
    static func test() {
        let stack = Stack<String>(capacity: 5)
        assert(stack.isEmpty)
        stack.push("Swift")
        stack.push("Java")
        stack.push("C")
        stack.push("C++")
        stack.push("PHP")
        
        assert(stack.pop() == "PHP")
        assert(stack.count == 4)
        assert(stack.pop() == "C++")
        assert(stack.pop() == "C")
        assert(stack.pop() == "Java")
        assert(stack.pop() == "Swift")
        assert(stack.isEmpty)
        
        print(Stack<Int>.reversePolish(notation: "9 3 1 - 3 * + 10 2 / +"))
    }
}
