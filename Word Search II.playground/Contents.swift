/*
 212. Word Search II
 Hard

 Given a 2D board and a list of words from the dictionary, find all words in the board.

 Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

  

 Example:

 Input:
 board = [
   ['o','a','a','n'],
   ['e','t','a','e'],
   ['i','h','k','r'],
   ['i','f','l','v']
 ]
 words = ["oath","pea","eat","rain"]

 Output: ["eat","oath"]
  

 Note:

 All inputs are consist of lowercase letters a-z.
 The values of words are distinct.
 */

import Foundation

class Solution {
    class Trie {
        var isCompleteWord: Bool = false
        var children: [Character: Trie] = [:]

        /** Initialize your data structure here. */
        init() {
            children.reserveCapacity(26)
        }
        
        /** Inserts a word into the trie. */
        func insert(_ word: String) {
            if word.isEmpty { return }
            
            var currentWord = word
            let first = currentWord.removeFirst()

            let child = children[first] ?? Trie()
            children[first] = child
            child.insert(currentWord)
            if word.count == 1 {
                child.isCompleteWord = true
            }
        }
        
        /** Returns if the word is in the trie. */
        func search(_ word: String) -> Bool {
            if word.isEmpty { return false }
            
            guard let child = children[word.first!] else {
                return false
            }
            
            if word.count == 1 {
                return child.isCompleteWord
            }
            
            var currentWord = word
            currentWord.removeFirst()
            return child.search(currentWord)
        }
        
        /** Returns if there is any word in the trie that starts with the given prefix. */
        func startsWith(_ prefix: String) -> Bool {
            if prefix.isEmpty { return true }
            
            guard let child = children[prefix.first!] else {
                return false
            }
            
            var currentWord = prefix
            currentWord.removeFirst()
            return child.startsWith(currentWord)
        }
    }
    
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        
        var result: Set<String> = []
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        
        for (row, rowArray) in board.enumerated() {
            for (column, _) in rowArray.enumerated() {
                dfs(board, trie, "", row: row, column: column, visited: &visited, result: &result)
            }
        }
        
        return Array(result)
    }
    
    func dfs(_ board: [[Character]], _ trie: Trie, _ string: String, row: Int, column: Int, visited: inout [[Bool]], result: inout Set<String>) {
        if row > board.count - 1 || row < 0 ||
        column > board[0].count - 1 || column < 0 ||
            visited[row][column] == true {
            return
        }
        
        var newString = string
        newString.append(board[row][column])
        if trie.startsWith(newString) == false { return }

        if trie.search(newString) {
            result.insert(newString)
        }
        
        visited[row][column] = true
        dfs(board, trie, newString, row: row, column: column - 1, visited: &visited, result: &result)
        dfs(board, trie, newString, row: row, column: column + 1, visited: &visited, result: &result)
        dfs(board, trie, newString, row: row - 1, column: column, visited: &visited, result: &result)
        dfs(board, trie, newString, row: row + 1, column: column, visited: &visited, result: &result)
        visited[row][column] = false
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
        let board: [[Character]] = [
          ["o","a","a","n"],
          ["e","t","a","e"],
          ["i","h","k","r"],
          ["i","f","l","v"]
        ]

        let words = ["oath","pea","eat","rain"]

        let results = solution.findWords(board, words)
        XCTAssertEqual(results, ["oath", "eat"])
    }
    
    func testExample2() {
        let board: [[Character]] = [
          ["a"]
        ]

        let words = ["a"]

        let results = solution.findWords(board, words)
        XCTAssertEqual(results, ["a"])
    }
}

SolutionTests.defaultTestSuite.run()
