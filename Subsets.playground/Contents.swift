/*
78. Subsets
Medium

Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
*/

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var dp : [Set<Int>:Set<[Int]>] = [:]
        let result = sub(Set(nums), dp: &dp)
        return Array(result)
    }
    
    func sub(_ nums: Set<Int>, dp: inout [Set<Int>:Set<[Int]>]) -> Set<[Int]> {
        // basecase
        var result: Set<[Int]> = Set()
        if nums.count == 0 {
            result.insert([])
            dp[nums] = result
            return result
        } else if nums.count == 1 {
            result.insert([])
            result.insert([nums.first!])
            dp[nums] = result
            return result
        } else {
            result.insert(Array(nums))
            for item in nums {
                var mutableNums = nums
                mutableNums.remove(item)
                
                if dp[mutableNums] != nil {
                    result.union(dp[mutableNums]!)
                } else {
                    result = result.union(sub(mutableNums, dp: &dp))
                    dp[mutableNums] = sub(mutableNums, dp: &dp)
                }
                
            }
            return result
        }
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
        let input = [1, 2, 3, 4]
        solution.subsets(input)
//         XCTAssertEqual(<# Result #>, <# Expected Result #>)
     }

}

SolutionTests.defaultTestSuite.run()
