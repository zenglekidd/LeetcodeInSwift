import UIKit

/*
 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.

 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).

 Note:

 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like ? or *.
 Example 1:

 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input:
 s = "aa"
 p = "*"
 Output: true
 Explanation: '*' matches any sequence.
 Example 3:

 Input:
 s = "cb"
 p = "?a"
 Output: false
 Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
 Example 4:

 Input:
 s = "adceb"
 p = "*a*b"
 Output: true
 Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
 Example 5:

 Input:
 s = "acdcb"
 p = "a*c?b"
 Output: false
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var i = 0
        var j = 0
        var match = 0
        var star = -1
        
        let sArray = Array(s)
        let pArray = Array(p)
        
        while i < sArray.count {
            if j < pArray.count && (sArray[i] == pArray[j] || pArray[j] == "?") {
                i += 1
                j += 1
            } else if j < pArray.count && (pArray[j] == "*") {
                star = j
                match = i
                j += 1
            } else if star != -1 {
                j = star + 1
                match += 1
                i = match
            } else {
                return false
            }
        }
        
        while j < pArray.count && pArray[j] == "*" {
            j += 1
        }
        
        return j == pArray.count
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
        let s = "aa"
        let p = "a"
        let results = solution.isMatch(s, p)
        XCTAssertEqual(results, false)
    }
    
    func test2() {
        let s = "aa"
        let p = "*"
        let results = solution.isMatch(s, p)
        XCTAssertEqual(results, true)
    }
    
    func test3() {
        let s = "cb"
        let p = "?a"
        let results = solution.isMatch(s, p)
        XCTAssertEqual(results, false)
    }
    
    func test4() {
        let s = "adceb"
        let p = "*a*b"
        let results = solution.isMatch(s, p)
        XCTAssertEqual(results, true)
    }
    
    func test5() {
        let s = "acdcb"
        let p = "a*c?b"
        let results = solution.isMatch(s, p)
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
