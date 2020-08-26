//
//  QueueTests.swift
//  DemoTests
//
//  Created by Phil.Feng on 2020/8/26.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import XCTest
@testable import Demo

class QueueTests: XCTestCase {
    var queue = CatDogQueue()
    
    override func setUp() {
        let cat1 = Cat(name: "cat1")
        let cat2 = Cat(name: "cat2")
        let cat3 = Cat(name: "cat3")
        
        let dog1 = Dog(name: "dog1")
        let dog2 = Dog(name: "dog2")
        let dog3 = Dog(name: "dog3")
        queue.add(pet: cat1)
        queue.add(pet: dog1)
        queue.add(pet: cat2)
        queue.add(pet: dog2)
        queue.add(pet: cat3)
        queue.add(pet: dog3)
    }
    
    func testRemoveDog() {
        let dogsName = queue.removeDog().map { $0.name }
        XCTAssertTrue(dogsName == ["dog1", "dog2", "dog3"])
        
        XCTAssertFalse(queue.empty())
        XCTAssertFalse(queue.catEmpty())
        XCTAssertTrue(queue.dogEmpty())
    }
    
    func testRemoveAll() {
        let petsName = queue.removeAll().map { $0.pet.name }
        XCTAssertTrue(petsName == ["cat1", "dog1", "cat2", "dog2", "cat3", "dog3"])
        
        XCTAssertTrue(queue.empty())
        XCTAssertTrue(queue.catEmpty())
        XCTAssertTrue(queue.dogEmpty())
    }
    
    func testRemoveCat() {
        let catsName = queue.removeCat().map { $0.name }
        XCTAssertTrue(catsName == ["cat1", "cat2", "cat3"])
        
        XCTAssertFalse(queue.empty())
        XCTAssertTrue(queue.catEmpty())
        XCTAssertFalse(queue.dogEmpty())
    }
}
