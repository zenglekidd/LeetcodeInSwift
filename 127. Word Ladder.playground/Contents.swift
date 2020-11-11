import Foundation

/*
 Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:

 Only one letter can be changed at a time.
 Each transformed word must exist in the word list.
 Note:

 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 
 Example 1:
 Input:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]

 Output: 5
 Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 
 Example 2:
 Input:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]

 Output: 0

 Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 */

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet: Set<String> = Set(wordList)
        if wordSet.contains(endWord) == false {return 0}
        
        var result = 1
        
        var todo: [String] = [beginWord]
        
        while todo.isEmpty == false {
            let n = todo.count
            for _ in 0 ..< n {
                let word = todo.removeFirst()
                if word == endWord {
                    return result
                }
                
                for j in 0 ..< word.count {
                    var wordArray = Array(word)
                    let c = wordArray[j]
                    for k in Array("abcdefghijklmnopqrstuvwxyz") {
                        wordArray[j] = k
                        if wordSet.contains(String(wordArray)) {
                            todo.append(String(wordArray))
                            wordSet.remove(String(wordArray))
                        }
                    }
                    wordArray[j] = c
                }
            }
            result += 1
        }
        
        return 0
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
        let beginWord = "hit"
        let endWord = "cog"
        let wordList = ["hot","dot","dog","lot","log","cog"]
        let results = solution.ladderLength(beginWord, endWord, wordList)
        XCTAssertEqual(results, 5)
    }
    
    func test2() {
        let beginWord = "hit"
        let endWord = "cog"
        let wordList = ["hot","dot","dog","lot","log"]
        let results = solution.ladderLength(beginWord, endWord, wordList)
        XCTAssertEqual(results, 0)
    }
}

SolutionTests.defaultTestSuite.run()
