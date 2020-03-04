/*
48. Rotate Image
Medium

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

Example 1:
Given input matrix =
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
],

rotate the input matrix in-place such that it becomes:
[
  [7,4,1],
  [8,5,2],
  [9,6,3]
]
 
Example 2:
Given input matrix =
[
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
],

rotate the input matrix in-place such that it becomes:
[
  [15,13, 2, 5],
  [14, 3, 4, 1],
  [12, 6, 8, 9],
  [16, 7,10,11]
]
*/

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        if matrix.isEmpty || matrix[0].isEmpty {
            return
        }
        
        let n = matrix.count
        
        var start = 0
        var end = n - 1
        
        while start < end {
            for i in 0 ..< end - start {
                swap(&matrix, x1: start, y1: start + i, x2: start + i, y2: end)
                swap(&matrix, x1: start, y1: start + i, x2: end, y2: end - i)
                swap(&matrix, x1: start, y1: start + i, x2: end - i, y2: start)
            }
            
            start += 1
            end -= 1
        }
    }
    
    func swap(_ matrix: inout [[Int]], x1:Int, y1:Int, x2:Int, y2:Int) {
        let temp = matrix[x1][y1]
        matrix[x1][y1] = matrix[x2][y2]
        matrix[x2][y2] = temp
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
        var input = [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]

        let output = [
          [7,4,1],
          [8,5,2],
          [9,6,3]
        ]

        solution.rotate(&input)
        XCTAssertEqual(input, output)
     }
    
    func testExample2() {
       var input = [
         [ 5, 1, 9,11],
         [ 2, 4, 8,10],
         [13, 3, 6, 7],
         [15,14,12,16]
       ]

       let output = [
         [15,13, 2, 5],
         [14, 3, 4, 1],
         [12, 6, 8, 9],
         [16, 7,10,11]
       ]

       solution.rotate(&input)
       XCTAssertEqual(input, output)
    }
}

SolutionTests.defaultTestSuite.run()
