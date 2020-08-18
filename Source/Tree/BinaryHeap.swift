//
//  BinaryHeap.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/12.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

struct BinaryHeap {
    public func buildMinHeap(heap: inout [Int]) {
        for index in stride(from: (heap.count - 2) / 2, through: 0, by: -1) {
            var idx = index
            minSinking(heap: &heap, parentIndex: &idx, count: heap.count)
        }
    }
    
    public func buildMaxHeap(heap: inout [Int]) {
        for index in stride(from: (heap.count - 2) / 2, through: 0, by: -1) {
            var idx = index
            maxSinking(heap: &heap, parentIndex: &idx, count: heap.count)
        }
    }
    
    public func maxFloating(heap: inout [Int]) {
        floating(withMin: false, heap: &heap)
    }
    
    public func minFloating(heap: inout [Int]) {
        floating(withMin: true, heap: &heap)
    }
}

private extension BinaryHeap {
    func maxSinking(heap: inout [Int], parentIndex: inout Int, count: Int) {
        sinking(withMin: false,
                heap: &heap,
                parentIndex: &parentIndex,
                count: count)
    }
    
    func minSinking(heap: inout [Int], parentIndex: inout Int, count: Int) {
        sinking(withMin: true,
                heap: &heap,
                parentIndex: &parentIndex,
                count: count)
    }
    
    func floating(withMin min: Bool, heap: inout [Int]) {
        var childIndex = heap.count - 1
        var parentIndex = (childIndex - 1) / 2
        let temp = heap[childIndex]
        let needExchange = min ? temp < heap[parentIndex] : temp > heap[parentIndex]
        
        while childIndex > 0 && needExchange {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (parentIndex - 1) / 2
        }
        heap[childIndex] = temp
    }
    
    func sinking(withMin min: Bool, heap: inout [Int], parentIndex: inout Int, count: Int) {
        let temp = heap[parentIndex]
        var childIndex = 2 * parentIndex + 1
        while childIndex < count {
            if childIndex + 1 < count {
                let moveIndex = min ? heap[childIndex + 1] < heap[childIndex] : heap[childIndex + 1] > heap[childIndex]
                if moveIndex {
                    childIndex += 1
                }
            }
            
            let needExchange = min ? temp <= heap[childIndex] : temp >= heap[childIndex]
            if needExchange { break }
            heap[parentIndex] = heap[childIndex]
            parentIndex = childIndex
            childIndex = 2 * childIndex + 1
        }
        heap[parentIndex] = temp
    }
}
