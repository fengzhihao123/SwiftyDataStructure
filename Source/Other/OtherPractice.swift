//
//  OtherPractice.swift
//  Demo
//
//  Created by Phil.Feng on 2020/8/31.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

struct OtherPractice {
    /// 获取最大公约数
    /// - Parameters:
    ///   - a: 参数1
    ///   - b: 参数2
    static func getGreatestCommonDivisor(a: Int, b: Int) -> Int {
        let maxValue = max(a, b)
        let minValue = min(a, b)
        let result = maxValue % minValue
        
        if result == 0 {
            return minValue
        }
        
        return getGreatestCommonDivisor(a: result, b: minValue)
    }
    
    /// 优化版 - 获取最大公约数；结合欧几里得和辗转相除
    /// - Parameters:
    ///   - a: 参数1
    ///   - b: 参数2
    static func ggcdOptimize(a: Int, b: Int) -> Int {
        guard a != b else {
            return a
        }
        
        if (a & 1) == 0 && (b & 1) == 0 {
            return ggcdOptimize(a: a >> 1, b: b >> 1) << 1
        } else if (a & 1) == 0 && (b & 1) != 0 {
            return ggcdOptimize(a: a >> 1, b: b)
        } else if (a & 1) != 0 && (b & 1) == 0 {
            return ggcdOptimize(a: a, b: b >> 1)
        } else {
            let maxValue = max(a, b)
            let minValue = min(a, b)
            return ggcdOptimize(a: maxValue - minValue, b: minValue)
        }
    }
    
    /// 判断是否为 2 的整数次幂
    /// - Parameter num: 参数
    static func isPowerOfTwo(num: Int) -> Bool {
        return (num & (num - 1)) == 0
    }
}
