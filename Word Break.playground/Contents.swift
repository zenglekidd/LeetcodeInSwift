/*
 139. Word Break
 Medium

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note:
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 
 Example 1:
 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 
 Example 2:
 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
              Note that you are allowed to reuse a dictionary word.
 
 Example 3:
 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
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
    
    func testExample1() {
        let results = solution.wordBreak("leetcode", ["leet", "code"])
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let results = solution.wordBreak("applepenapple", ["apple", "pen"])
        XCTAssertEqual(results, true)
    }
    
    func testExample3() {
        let results = solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
