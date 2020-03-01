/*
 79. Word Search
 Medium

 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example:

 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]

 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
 */

import Foundation

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty { return false }
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        
        for (row, rowArray) in board.enumerated() {
            for (column, _) in rowArray.enumerated() {
                if dfs(board, word, row: row, column: column, index: 0, visited: &visited) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func dfs(_ board: [[Character]], _ word: String, row: Int, column: Int, index: Int, visited: inout [[Bool]]) -> Bool {
        if index == word.count { return true }
        
        let wordArray = Array(word)
        if row > board.count - 1 || row < 0 ||
        column > board[0].count - 1 || column < 0 ||
            wordArray[index] != board[row][column] || visited[row][column] == true {
            return false
        }
        
        visited[row][column] = true
        if  dfs(board, word, row: row, column: column - 1, index: index + 1, visited: &visited) ||
            dfs(board, word, row: row, column: column + 1, index: index + 1, visited: &visited) ||
            dfs(board, word, row: row - 1, column: column, index: index + 1, visited: &visited) ||
            dfs(board, word, row: row + 1, column: column, index: index + 1, visited: &visited) {
            return true
        }
        visited[row][column] = false
        return false
    }
}

import Foundation
import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    let board: [[Character]] = [
        ["A","B","C","E"],
        ["S","F","C","S"],
        ["A","D","E","E"]
    ]
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExample1() {
        let results = solution.exist(board, "ABCCED")
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let results = solution.exist(board, "SEE")
        XCTAssertEqual(results, true)
    }

    func testExample3() {
        let results = solution.exist(board, "ABCB")
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
