/*
54. Spiral Matrix
Medium

Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

Example 1:

Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
Output: [1,2,3,6,9,8,7,4,5]
Example 2:

Input:
[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
*/

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty || matrix[0].isEmpty {
            return []
        }
        
        let row = matrix.count
        let column = matrix[0].count

        var direction: Direction = .right
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)

        let stepCount = row * column

        var result: [Int] = []
        var x = 0
        var y = -1
        for _ in 0 ..< stepCount {
            let xy = direction.xy()
            x = x + xy.x
            y = y + xy.y
            result.append(matrix[x][y])
            visited[x][y] = true

            let nextX = x + xy.x
            let nextY = y + xy.y
            if nextX < 0 || nextX >= row || nextY < 0 || nextY >= column || visited[nextX][nextY] {
                direction = direction.next()
            }
        }


        return result
    }
    
    enum Direction: CaseIterable {
        case right, down, left, up
        
        func next() -> Direction {
            let all = type(of: self).allCases
            if self == all.last! {
                return all.first!
            } else {
                let index = all.firstIndex(of: self)!
                return all[index + 1]
            }
        }
        
        func xy() -> (x: Int, y: Int) {
            switch self {
            case .right:
                return (0, 1)
            case .down:
                return (1, 0)
            case .left:
                return (0, -1)
            case .up:
                return (-1, 0)
            }
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
        let input = [
         [ 1, 2, 3 ],
         [ 4, 5, 6 ],
         [ 7, 8, 9 ]
        ]
        let output = [1,2,3,6,9,8,7,4,5]
        XCTAssertEqual(solution.spiralOrder(input), output)
     }

    func testExample2() {
       let input = [
         [1, 2, 3, 4],
         [5, 6, 7, 8],
         [9,10,11,12]
       ]
        let output = [1,2,3,4,8,12,11,10,9,5,6,7]
        XCTAssertEqual(solution.spiralOrder(input), output)
    }

    func testExample3() {
        let input: [[Int]] = []
        let output: [Int] = []
        XCTAssertEqual(solution.spiralOrder(input), output)
    }
}

SolutionTests.defaultTestSuite.run()
