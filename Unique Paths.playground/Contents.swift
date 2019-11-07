import Cocoa
/*
 62. Unique Paths
 Medium
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?


 Above is a 7 x 3 grid. How many possible unique paths are there?

 Note: m and n will be at most 100.

 Example 1:
 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 
 Example 2:
 Input: m = 7, n = 3
 Output: 28
 */

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        
        var pathCount: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for col in 0 ..< m {
            pathCount[0][col] = 1
        }
        
        for row in 0 ..< n {
            pathCount[row][0] = 1
        }
        
        for row in 1 ..< n {
            for col in 1 ..< m {
                pathCount[row][col] = pathCount[row - 1][col] + pathCount[row][col - 1]
            }
        }

        return pathCount[n - 1][m - 1]
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
        let results = solution.uniquePaths(3, 2)
        XCTAssertEqual(results, 3)
    }
    
    func testExample2() {
        let results = solution.uniquePaths(7, 3)
        XCTAssertEqual(results, 28)
    }
}

SolutionTests.defaultTestSuite.run()
