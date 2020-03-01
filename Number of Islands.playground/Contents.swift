/*
 200. Number of Islands
 Medium

 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:
 Input:
 11110
 11010
 11000
 00000
 Output: 1
 
 Example 2:
 Input:
 11000
 11000
 00100
 00011
 Output: 3
 */

import Foundation

class Solution {
    struct Queue<T> {
        var list = Array<T>()
        
        mutating func enqueue(_ element: T) {
            list.append(element)
        }
        
        mutating func dequeue() -> T? {
            guard list.isEmpty == false else { return nil }
            return list.removeFirst()
        }
        
        func isEmpty() -> Bool {
            return list.isEmpty
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        
        let row = grid.count
        let column = grid[0].count
        
        var count = 0
        var mutableGrid = grid

        for i in 0..<row {
            for j in 0..<column {
                if mutableGrid[i][j] == "1" {
                    count += 1
                    dfs(&mutableGrid, x: i, y: j)
                }
            }
        }

        return count
    }
    
    func dfs(_ grid: inout [[Character]], x: Int, y: Int) {
        let row = grid.count
        let column = grid[0].count
        
        if x < 0 || x >= row || y < 0 || y >= column || grid[x][y] == "0" {
            return
        }
        
        grid[x][y] = "0"
        
        dfs(&grid, x: x+1, y: y)
        dfs(&grid, x: x-1, y: y)
        dfs(&grid, x: x, y: y+1)
        dfs(&grid, x: x, y: y-1)
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
        let grid: [[Character]] = [
                    ["1","1","1","1","0"],
                    ["1","1","0","1","0"],
                    ["1","1","0","0","0"],
                    ["0","0","0","0","0"],
                   ]
        
        XCTAssertEqual(solution.numIslands(grid), 1)
     }
    
//    func testExample2() {
//       let grid: [[Character]] = [
//                   ["1","1","0","0","0"],
//                   ["1","1","0","0","0"],
//                   ["0","0","1","0","0"],
//                   ["0","0","0","1","1"],
//                  ]
//
//       XCTAssertEqual(solution.numIslands(grid), 3)
//    }

}

SolutionTests.defaultTestSuite.run()
