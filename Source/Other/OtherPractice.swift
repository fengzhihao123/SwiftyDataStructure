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
    
    /// 计算大数的和
    /// - Parameters:
    ///   - num1: num1
    ///   - num2: num2
    static func bigNumSum(num1: String, num2: String) -> String {
        var num1Arr = [Int]()
        for i in 0..<num1.count {
            num1Arr.append(Int(String(num1[num1.index(num1.endIndex, offsetBy: -1 - i)])) ?? 0)
        }
        
        var num2Arr = [Int]()
        for i in 0..<num2.count {
            num2Arr.append(Int(String(num2[num2.index(num2.endIndex, offsetBy: -1 - i)])) ?? 0)
        }
        let maxCount = max(num1Arr.count, num2Arr.count)
        var result = Array(repeating: "0", count: maxCount)
        var addation = 0
        
        for i in 0..<maxCount {
            var num1 = 0
            if i < num1Arr.count {
                num1 = num1Arr[i]
            }
            
            var num2 = 0
            if i < num2Arr.count {
                num2 = num2Arr[i]
            }
            
            let sum = num1 + num2 + addation
            result[i] = String(sum % 10)
            addation = sum / 10
        }
        
        if addation == 1 {
            result.append("1")
        }
        
        result = result.reversed()
        return result.joined()
    }
}
