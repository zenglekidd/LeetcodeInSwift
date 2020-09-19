import UIKit

/*
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 Example:

 Consider the following matrix:

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 Given target = 5, return true.

 Given target = 20, return false.
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix.first?.count == 0 { return false }
        if matrix[0][0] > target { return false}
        
        let row = matrix.count
        let column = matrix[0].count
        
        // Top right corner
        var n = column - 1
        var m = 0
        
        var i = 0
        
        while i < row + column {
            print("before: \(m), \(n)")
            if matrix[m][n] == target {
                return true
            }
            else if target < matrix[m][n] {
                n -= 1
            } else {
                m += 1
            }
            
            print("after: \(m), \(n)")

            if n < 0 || m >= row {
                return false
            }

            i += 1
        }

        return false
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
        let input =  [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ]
        let result = solution.searchMatrix(input, 5)
        XCTAssertEqual(result, true)
    }

    func testExample2() {
        let input =  [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ]
        let result = solution.searchMatrix(input, 20)
        XCTAssertEqual(result, false)
    }

    func testExample3() {
        let input =  [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ]
        let result = solution.searchMatrix(input, 18)
        XCTAssertEqual(result, true)
    }

    func testExample4() {
        let input =  [[1,1]]
        let result = solution.searchMatrix(input, 1)
        XCTAssertEqual(result, true)
    }
    
    func testExample5() {
        let input =  [[1,1]]
        let result = solution.searchMatrix(input, 2)
        XCTAssertEqual(result, false)
    }
}

SolutionTests.defaultTestSuite.run()
