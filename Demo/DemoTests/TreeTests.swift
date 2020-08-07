//
//  TreeTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/7.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo

class TreeTests: XCTestCase {
    var tree: BinaryTree<String>!
    
    override func setUp() {
        let left111 = BinaryTree.node(.empty, "8", .empty)
        
        let left11 = BinaryTree.node(left111, "4", .empty)
        let right11 = BinaryTree.node(.empty, "5", .empty)
        
        
        let right1 = BinaryTree.node(.empty, "3", .empty)
        
        let left1 = BinaryTree.node(left11, "2", right11)
        tree = BinaryTree.node(left1, "1", right1)
    }

    override func tearDown() {
        tree = nil
    }

    func testPreOrder() {
        var preOrderResult = [String]()
        tree.traversePreOrder { preOrderResult.append($0) }
        XCTAssert(preOrderResult == ["1", "2", "4", "8", "5", "3"])
    }
    
    func testInOrder() {
        var inOrderResult = [String]()
        tree.traverseInOrder { inOrderResult.append($0) }
        XCTAssert(inOrderResult == ["8", "4", "2", "5", "1", "3"])
    }
    
    func testPostOrder() {
        var postOrderResult = [String]()
        tree.traversePostOrder { postOrderResult.append($0) }
        XCTAssert(postOrderResult == ["8", "4", "5", "2", "3", "1"])
    }
    
    func testLevelOrder() {
        var levelOrderResult = [String]()
        tree.traverseLevelOrder { levelOrderResult.append($0) }
        XCTAssert(levelOrderResult == ["1", "2", "3", "4", "5", "8"])
    }
    
    func testTreeCount() {
        XCTAssert(tree.count == 6)
    }
}
