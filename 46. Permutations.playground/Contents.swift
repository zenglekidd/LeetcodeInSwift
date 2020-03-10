/*
https://leetcode.com/problems/permutations/
46. Permutations
Medium

Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
*/

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        backtracking(0, nums, pool:nums, subset:[], result:&result)
        return result
    }
    
    func backtracking(_ index: Int, _ nums:[Int], pool: [Int], subset: [Int], result: inout [[Int]]) {
        if index == nums.count {
            result.append(subset)
            return
        }

        for i in 0 ..< pool.count {
            var mutableSubset = subset
            mutableSubset.append(pool[i])
            var mutablePool = pool
            mutablePool.remove(at: i)
            backtracking(index+1, nums, pool:mutablePool, subset:mutableSubset, result:&result)
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
    
    func testLeetcodeExample1() {
        let input = [1,2,3]
        XCTAssertEqual(solution.permute(input), [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
    }

}

SolutionTests.defaultTestSuite.run()
