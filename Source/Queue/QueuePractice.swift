//
//  QueuePractice.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/26.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

class Pet {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Cat: Pet { }
class Dog: Pet { }

struct CatDog {
    let pet: Pet!
    let count: Int
}

struct CatDogQueue {
    private var catQueue: [CatDog]
    private var dogQueue: [CatDog]
    
    init() {
        catQueue = []
        dogQueue = []
    }
    
    mutating func add(pet: Pet) {
        let count = catQueue.count + dogQueue.count
        let catdog = CatDog(pet: pet, count: count)
        if pet is Dog  {
            dogQueue.append(catdog)
        } else {
            catQueue.append(catdog)
        }
    }
    
    @discardableResult
    mutating func removeAll() -> [CatDog] {
        var result = [CatDog]()
        
        while !dogQueue.isEmpty && !catQueue.isEmpty {
            let dogHead = dogQueue.first!
            let catHead = catQueue.first!
            if dogHead.count < catHead.count {
                result.append(dogQueue.removeFirst())
            } else {
                result.append(catQueue.removeFirst())
            }
        }
        
        while !dogQueue.isEmpty {
            result.append(dogQueue.removeFirst())
        }
        
        while !catQueue.isEmpty {
            result.append(catQueue.removeFirst())
        }
        
        return result
    }
    
    @discardableResult
    mutating func removeDog() -> [Dog] {
        var result = [Dog]()
        while !dogQueue.isEmpty {
            result.append(dogQueue.removeFirst().pet as! Dog)
        }
        return result
    }
    
    @discardableResult
    mutating func removeCat() -> [Cat] {
        var result = [Cat]()
        while !catQueue.isEmpty {
            result.append(catQueue.removeFirst().pet as! Cat)
        }
        return result
    }
    
    func empty() -> Bool {
        return catQueue.isEmpty && dogQueue.isEmpty
    }
    
    func catEmpty() -> Bool {
        return catQueue.isEmpty
    }
    
    func dogEmpty() -> Bool {
        return dogQueue.isEmpty
    }
}
