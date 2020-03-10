/*
https://leetcode.com/problems/minimum-path-sum/
64. Minimum Path Sum
Medium

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example:

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.
*/

import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0}
        
        let row = grid.count
        let column = grid[0].count
        
        var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: column), count: row)
        
        return minSum(grid, row - 1, column - 1, dp: &dp)
    }
    
    func minSum(_ grid: [[Int]], _ m: Int, _ n: Int, dp: inout [[Int?]]) -> Int {
        if m == 0 && n == 0 {
            dp[0][0] = grid[0][0]
            return grid[0][0]
        }
        
        if m == 0 {
            if dp[m][n] == nil {
                dp[m][n] = minSum(grid, m, n-1, dp: &dp) + grid[m][n]
            }
        }
        
        if n == 0 {
            if dp[m][n] == nil {
                dp[m][n] = minSum(grid, m-1, n, dp: &dp) + grid[m][n]
            }
        }
        
        if dp[m][n] == nil {
            let minTop = minSum(grid, m-1, n, dp: &dp)
            let minLeft = minSum(grid, m, n-1, dp: &dp)
            dp[m][n] = min(minTop, minLeft) + grid[m][n]
        }
        
        return dp[m][n]!
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
        let input = [
          [1,3,1],
          [1,5,1],
          [4,2,1]
        ]
        XCTAssertEqual(solution.minPathSum(input), 7)
    }

}

SolutionTests.defaultTestSuite.run()
