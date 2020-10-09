import UIKit

/*
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.

 Example:

 X X X X
 X O O X
 X X O X
 X O X X
 After running your function, the board should be:

 X X X X
 X X X X
 X X X X
 X O X X
 Explanation:

 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 */

class Solution {
    var shouldKeepEverything = false
    
    func solve(_ board: inout [[Character]]) {
        if board.count == 0 { return }
        let row = board.count
        let column = board[0].count
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)

        for m in 0 ..< row {
            for n in 0 ..< column {
                if board[m][n] == "O" && visited[m][n] == false  {
                    var current = board
                    dfs(&current, m, n, &visited)
                    if shouldKeepEverything == false {
                        // reset board
                        board = current
                    } else {
                        // reset flag
                        shouldKeepEverything = false
                    }
                    
                }
            }
        }
    }
    
    func dfs(_ board: inout [[Character]], _ m: Int, _ n: Int, _ visited: inout [[Bool]]) {
        if board.count == 0 {return}
        let row = board.count
        let column = board[0].count
        
        visited[m][n] = true
        board[m][n] = "X"
        if m == 0 || n == 0 || m == row - 1 || n == column - 1 {
            // keep everything
            shouldKeepEverything = true
        }
        
        let diff = [
            (1,0),
            (-1,0),
            (0,-1),
            (0,1),
        ]
        for (x, y) in diff {
            if isSafe(&board, m + x, n + y, &visited) {
                dfs(&board, m + x, n + y, &visited)
            }
        }
    }
    
    func isSafe(_ board: inout [[Character]], _ m: Int, _ n: Int, _ visited: inout [[Bool]]) -> Bool {
        let row = board.count
        let column = board[0].count
        if m >= 0 && m <= row - 1 && n >= 0 && n <= column - 1 && board[m][n] == "O" && visited[m][n] == false {
            return true
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
    
    func test1() {
        var input: [[Character]] = [
            ["X","X","X","X"],
            ["X","O","O","X"],
            ["X","X","O","X"],
            ["X","O","X","X"],
        ]
        
        let result: [[Character]] = [
            ["X","X","X","X"],
            ["X","X","X","X"],
            ["X","X","X","X"],
            ["X","O","X","X"],
        ]
        
        solution.solve(&input)
        XCTAssertEqual(input, result)
    }
}

SolutionTests.defaultTestSuite.run()
