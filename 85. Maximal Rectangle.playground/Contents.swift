/*
 85. Maximal Rectangle
 Hard

 Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.

 Example:
 Input:
 [
   ["1","0","1","0","0"],
   ["1","0","1","1","1"],
   ["1","1","1","1","1"],
   ["1","0","0","1","0"]
 ]
 Output: 6
*/

import Foundation

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        
        let row = matrix.count
        let column = matrix[0].count
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: column), count: row)
        
        for m in 0 ..< row {
            dp[m][0] = (matrix[m][0] == Character("1")) ? 1 : 0
        }
        
        for n in 1 ..< column {
            dp[0][n] = (matrix[0][n] == Character("1")) ? 1 : 0
        }
        
        for m in 1 ..< row {
            for n in 1 ..< column {
                if matrix[m][n] == Character("0") {
                    dp[m][n] = 0
                    continue
                }
                
                if dp[m-1][n-1] == 0 || dp[m-1][n] == 0 || dp[m][n-1] == 0 {
                    dp[m][n] = 1
                } else {
                    
                    dp[m][n] = min(min(dp[m-1][n-1], dp[m-1][n]), dp[m][n-1]) + 1
                }
            }
        }
        
        print(dp)
        
        return dp[row - 1][column - 1] * dp[row - 1][column - 1]
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
        let input: [[Character]] = [
          ["1","0","1","0","0"],
          ["1","0","1","1","1"],
          ["1","1","1","1","1"],
          ["1","0","0","1","0"]
        ]
        XCTAssertEqual(solution.maximalRectangle(input), 6)
    }
}

SolutionTests.defaultTestSuite.run()
