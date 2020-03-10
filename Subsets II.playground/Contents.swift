/*
90. Subsets II
Medium

Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: [1,2,2]
Output:
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]
*/

import Foundation

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = Set()
        var subset: [Int?] = Array(repeating: nil, count: nums.count)
        
        helper(nums, subset: &subset, index: 0, result: &result)
        return Array(result)
    }
    
    func helper(_ nums: [Int], subset: inout [Int?], index: Int, result: inout Set<[Int]>) {
        if index == nums.count {
            result.insert(subset.compactMap{$0}.sorted())
            return
        } else {
            subset[index] = nil
            helper(nums, subset: &subset, index: index + 1, result: &result)
            subset[index] = nums[index]
            helper(nums, subset: &subset, index: index + 1, result: &result)
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
        let input = [1,2,2]
        XCTAssertEqual(solution.subsetsWithDup(input), [[2], [1, 2, 2], [2, 2], [1], [1, 2], []])
     }

}

SolutionTests.defaultTestSuite.run()
