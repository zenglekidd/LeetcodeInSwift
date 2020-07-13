//
// Contents.swift
//
// Created by Le Zeng on 2020/7/14.
// Copyright © 2020. All rights reserved.
//
/*
416. Partition Equal Subset Sum

Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

Note:
Each of the array element will not exceed 100.
The array size will not exceed 200.
 
Example 1:
Input: [1, 5, 11, 5]
Output: true
Explanation: The array can be partitioned as [1, 5, 5] and [11].
 
Example 2:
Input: [1, 2, 3, 5]
Output: false
Explanation: The array cannot be partitioned into equal sum subsets.
*/

import Foundation

class Solution {
	func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0) {$0 + $1}
        if sum % 2 == 1 { return false }
        let target = sum / 2
        return backtrackingSum(nums.sorted().reversed(), target, 0, target)
    }
    
    func backtrackingSum(_ pool: [Int], _ remaining: Int, _ index: Int, _ target:Int) -> Bool {
        if index >= pool.count { return false }
        if remaining < pool[index] { return false }
        
        if remaining == pool[index] { return true }
        
        return backtrackingSum(pool, remaining - pool[index], index + 1, target) || backtrackingSum(pool, remaining, index + 1, target)
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
        let input = [1, 5, 11, 5]
        let output = true
        XCTAssertEqual(solution.canPartition(input), output)
    }

    func testLeetcodeExample2() {
        let input = [1, 2, 3, 5]
        let output = false
        XCTAssertEqual(solution.canPartition(input), output)
    }

    func testLeetcodeExample3() {
        let input = [3, 3, 3, 4, 5]
        let output = true
        XCTAssertEqual(solution.canPartition(input), output)
    }

    func testLeetcodeExample4() {
        let input =     [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100]
        let output = true
        XCTAssertEqual(solution.canPartition(input), output)
    }

    func testLeetcodeExample5() {
        let input =         [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,100]
        let output = false
        XCTAssertEqual(solution.canPartition(input), output)
    }
    
    func testLeetcodeExample6() {
        let input = [2,2,3,5]
        let output = false
        XCTAssertEqual(solution.canPartition(input), output)
    }
}

SolutionTests.defaultTestSuite.run()
