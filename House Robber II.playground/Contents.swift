import Cocoa
/*
 213. House Robber II
 Medium

 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

 Example 1:
 Input: [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
              because they are adjacent houses.
 
 Example 2:
 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
              Total amount you can rob = 1 + 3 = 4.
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {

        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        } else if nums.count == 3 {
            return max(nums[0], nums[1], nums[2])
        }

        
        let rob1 = rob(nums, from: 0, to: nums.count - 2)
        let rob2 = rob(nums, from: 1, to: nums.count - 1)
        return max(rob1, rob2)
    }
    
    private func rob(_ inputNums: [Int], from: Int, to: Int) -> Int {
        let nums = Array(inputNums[from...to])
        
        var maxSoFar: [Int] = Array(repeating: 0, count: nums.count)
        
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        } else if nums.count == 3 {
            return max(nums[0] + nums[2], nums[1])
        }
        
        maxSoFar[0] = nums[0]
        maxSoFar[1] = max(nums[0], nums[1])
        maxSoFar[2] = max(nums[0] + nums[2], nums[1])
        for i in 3 ..< nums.count {
            maxSoFar[i] = max(maxSoFar[i-2], maxSoFar[i-3]) + nums[i]
        }
        
        var largest = Int.min
        for i in 0 ..< nums.count {
            if maxSoFar[i] > largest {
                largest = maxSoFar[i]
            }
        }
        
        return largest
    }
}

import Foundation
import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExample1() {
        let results = solution.rob([2,3,2])
        XCTAssertEqual(results, 3)
    }

    func testExample2() {
        let results = solution.rob([1,2,3,1])
        XCTAssertEqual(results, 4)
    }
    
    func testExample3() {
        let results = solution.rob([1,2,1,1])
        XCTAssertEqual(results, 3)
    }
}

SolutionTests.defaultTestSuite.run()
