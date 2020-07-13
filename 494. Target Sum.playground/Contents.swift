//
// Contents.swift
//
// Created by Le Zeng on 2020/7/10.
// Copyright © 2020. All rights reserved.
//
/*
494. Target Sum

You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

Find out how many ways to assign symbols to make sum of integers equal to target S.

Example 1:
Input: nums is [1, 1, 1, 1, 1], S is 3.
Output: 5
Explanation:

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3

There are 5 ways to assign symbols to make the sum of nums be target 3.

Constraints:
The length of the given array is positive and will not exceed 20.
The sum of elements in the given array will not exceed 1000.
Your output answer is guaranteed to be fitted in a 32-bit integer.
*/

import Foundation

class Solution {
	func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        if nums.count == 0 {return 0}
        
        var dp: [Int: Int] = merge([nums[0]: 1], dict2: [-nums[0]:1])
        for i in 1 ..< nums.count {
            var dpAdd: [Int: Int] = [:]
            var dpSubtract: [Int: Int] = [:]
            for (key, _) in dp {
                dpAdd[key + nums[i]] = dp[key]
                dpSubtract[key - nums[i]] = dp[key]
            }
            
            dp = merge(dpAdd, dict2: dpSubtract)
        }
        
        return dp[S] ?? 0
    }
    
    func merge(_ dict1: [Int:Int], dict2: [Int: Int]) -> [Int: Int] {
        var result: [Int: Int] = dict1
        for (key, value) in dict2 {
            result[key] = (result[key] ?? 0) + value
        }
        return result
    }
}

import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testLeetcodeExample1() {
        let input = [1,1,1,1,1]
        XCTAssertEqual(solution.findTargetSumWays(input, 3), 5)
    }
    
    func testLeetcodeExample2() {
        let input = [0,0,0,0,0,0,0,0,1]
        XCTAssertEqual(solution.findTargetSumWays(input, 1), 256)
    }
}

SolutionTests.defaultTestSuite.run()
