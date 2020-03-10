/*
https://leetcode.com/problems/sudoku-solver/
37. Sudoku Solver
Hard

Write a program to solve a Sudoku puzzle by filling the empty cells.

A sudoku solution must satisfy all of the following rules:

Each of the digits 1-9 must occur exactly once in each row.
Each of the digits 1-9 must occur exactly once in each column.
Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
Empty cells are indicated by the character '.'.


A sudoku puzzle...


...and its solution numbers marked in red.

Note:

The given board contain only digits 1-9 and the character '.'.
You may assume that the given Sudoku puzzle will have a single unique solution.
The given board size is always 9x9.
*/

import Foundation

class Solution {
	func solveSudoku(_ board: inout [[Character]]) {
        let originalRow = board[0]
        solveSudoku(&board, row: 0, column: 0, originalRow: originalRow)
    }
    
    func solveSudoku(_ board: inout [[Character]], row: Int, column: Int, originalRow: [Character]) {
        // basecase
        if row == 9 {
            return
        }
        
        let nextItemRow = (column + 1) == 9 ? row + 1 : row
        let nextItemColumn = (column + 1) == 9 ? 0 : column + 1

        var nextRow : [Character]
        if row == 8 {
            nextRow = []
        } else {
            nextRow = board[row + 1]
        }
        let nextOriginalRow = (column + 1) == 9 ? nextRow : originalRow

        if board[row][column] == "." {
            // fill item
            // check valid
            let nums: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            
            var noSolution = true
            for item in nums {
                board[row][column] = item
                if isValid(board, row: row, column: column) {
                    solveSudoku(&board, row: nextItemRow, column: nextItemColumn, originalRow: nextOriginalRow)
                    noSolution = false
                }
            }
            if noSolution == true {
                // go back
                for i in 0 ..< 9 {
                    board[row][i] = originalRow[i]
                }
                return
            }
        } else {
            solveSudoku(&board, row: nextItemRow, column: nextItemColumn, originalRow: nextOriginalRow)
        }
    }
    
    func isValid(_ board: [[Character]], row: Int, column: Int) -> Bool {
        return isValidRow(board, row: row, column: column) &&
            isValidColumn(board, row: row, column: column) &&
            isValidSubBox(board, row: row, column: column)
    }
    
    func isValidRow(_ board: [[Character]], row: Int, column: Int) -> Bool {
        for i in 0 ..< 9 {
            if (i != column) && board[row][column] == board[row][i] {
                return false
            }
        }
        return true
    }
    
    func isValidColumn(_ board: [[Character]], row: Int, column: Int) -> Bool {
        for i in 0 ..< 9 {
            if (i != row) && board[row][column] == board[i][column] {
                return false
            }
        }
        return true
    }
    
    func isValidSubBox(_ board: [[Character]], row: Int, column: Int) -> Bool {
        for m in row/3*3 ..< row/3*3 + 3 {
            for n in column/3*3 ..< column/3*3 + 3 {
                if !(m == row && n == column) && board[row][column] == board[m][n] {
                    return false
                }
            }
        }
        return true
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
        var input: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        solution.solveSudoku(&input)
        XCTAssertEqual(input, [[]])
    }

}

SolutionTests.defaultTestSuite.run()
