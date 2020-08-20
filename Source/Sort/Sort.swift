//
//  Array+Sort.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/19.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import Foundation

struct Sort {
    static func bubbleSort(target: [Int]) -> [Int] {
        var result = target
        for outIndex in stride(from: result.count - 1, through: 0, by: -1) {
            for inIndex in 0...outIndex {
                if result[outIndex] < result[inIndex] {
                    result.swapAt(outIndex, inIndex)
                }
            }
        }
        return result
    }
    
    static func quickSort(target: [Int]) -> [Int] {
        guard target.count > 1 else { return target }
        let piovt = target[0]
        let less = target.filter { $0 < piovt }
        let equal = target.filter { $0 == piovt }
        let greater = target.filter { $0 > piovt}
        return quickSort(target: less) + equal + quickSort(target: greater)
    }
    
    static func quickSort(target: inout [Int], start: Int, end: Int) {
        guard start < end else { return }
        let pivot = partition(arr: &target, start: start, end: end)
        quickSort(target: &target, start: start, end: pivot - 1)
        quickSort(target: &target, start: pivot + 1, end: end)
    }
    
    private static func partition(arr: inout [Int], start: Int, end: Int) -> Int {
        let pivot = arr[start]
        var mark = start
        for idx in (start + 1)...end {
            if arr[idx] < pivot {
                mark += 1
                arr.swapAt(mark, idx)
            }
        }
        
        arr[start] = arr[mark]
        arr[mark] = pivot
        return mark
    }
}
