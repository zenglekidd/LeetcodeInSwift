/*
73. Set Matrix Zeroes
Medium

Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

Example 1:

Input:
[
  [1,1,1],
  [1,0,1],
  [1,1,1]
]
Output:
[
  [1,0,1],
  [0,0,0],
  [1,0,1]
]
 
Example 2:
Input:
[
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]
Output:
[
  [0,0,0,0],
  [0,4,5,0],
  [0,3,1,0]
]
 
Follow up:
A straight forward solution using O(mn) space is probably a bad idea.
A simple improvement uses O(m + n) space, but still not the best solution.
Could you devise a constant space solution?
*/

import Foundation

class Solution {
    var shouldSetFirstRow = false
    var shouldSetFirstColumn = false
    
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.isEmpty || matrix[0].isEmpty {
            return
        }
        
        let row = matrix.count
        let column = matrix[0].count
        var m = 0
        var n = 0
    
        if matrix[0][0] == 0 {
            shouldSetFirstColumn = true
            shouldSetFirstRow = true
        } else {
            for j in 1 ..< column {
                if matrix[0][j] == 0 {
                    shouldSetFirstRow = true
                    n = j
                    break
                }
            }

            for i in 1 ..< row {
                if matrix[i][0] == 0 {
                    shouldSetFirstColumn = true
                    m = i
                    break
                }
            }
        }
        
        for i in 1 ..< row {
            for j in 1 ..< column {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        
        for i in 1 ..< row {
            if matrix[i][0] == 0 {
                setZeroesRow(&matrix, x: i, y: 0)
            }
        }
        
        for j in 1 ..< column {
            if matrix[0][j] == 0 {
                setZeroesColumn(&matrix, x: 0, y: j)
            }
        }

        if shouldSetFirstColumn == true {
            setZeroesColumn(&matrix, x: m, y: 0)
        }
        
        if shouldSetFirstRow == true {
            setZeroesRow(&matrix, x: 0, y: n)
        }
    }
    
    func setZeroesRow(_ matrix: inout [[Int]], x: Int, y: Int) {
        let column = matrix[0].count

        if matrix[x][y] == 0 {
            for j in 0 ..< column {
                matrix[x][j] = 0
            }
        }
    }
    
    func setZeroesColumn(_ matrix: inout [[Int]], x: Int, y: Int) {
        let row = matrix.count
        
        if matrix[x][y] == 0 {
            for i in 0 ..< row {
                matrix[i][y] = 0
            }
        }
    }
    
    func setZeroes(_ matrix: inout [[Int]], x: Int, y: Int) {
        if matrix[x][y] == 0 {
            setZeroesRow(&matrix, x: x, y: y)
            setZeroesColumn(&matrix, x: x, y: y)
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
        var array = [
          [1,1,1],
          [1,0,1],
          [1,1,1]
        ]

        let result = [
          [1,0,1],
          [0,0,0],
          [1,0,1]
        ]

        solution.setZeroes(&array)
        XCTAssertEqual(array, result)
     }

    func testExample2() {
       var array = [
         [0,1,2,0],
         [3,4,5,2],
         [1,3,1,5]
       ]

       let result = [
         [0,0,0,0],
         [0,4,5,0],
         [0,3,1,0]
       ]

       solution.setZeroes(&array)
       XCTAssertEqual(array, result)
    }

    func testExample3() {
       var array = [[0,0,0,5],[4,3,1,4],[0,1,1,4],[1,2,1,3],[0,0,1,1]]

       let result = [[0,0,0,0],[0,0,0,4],[0,0,0,0],[0,0,0,3],[0,0,0,0]]

       solution.setZeroes(&array)
       XCTAssertEqual(array, result)
    }

    func testExample4() {
       var array = [[0,0,0,5],[4,3,1,4],[0,1,1,4],[1,2,1,3],[0,0,1,1]]

       let result = [[0,0,0,0],[0,0,0,4],[0,0,0,0],[0,0,0,3],[0,0,0,0]]

       solution.setZeroes(&array)
       XCTAssertEqual(array, result)
    }

    func testExample5() {
       var array = [[1,0]]

       let result = [[0,0]]

       solution.setZeroes(&array)
       XCTAssertEqual(array, result)
    }

    func testExample6() {
       var array = [[1],[0]]

       let result = [[0],[0]]

       solution.setZeroes(&array)
       XCTAssertEqual(array, result)
    }

    func testExample7() {
       var array = [[-4,-2147483648,6,-7,0],[-8,6,-8,-6,0],[2147483647,2,-9,-6,-10]]

       let result = [[0,0,0,0,0],[0,0,0,0,0],[2147483647,2,-9,-6,0]]

       solution.setZeroes(&array)
       XCTAssertEqual(array, result)
    }
}

SolutionTests.defaultTestSuite.run()
