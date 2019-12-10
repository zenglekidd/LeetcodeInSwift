/*
 5. Longest Palindromic Substring
 Medium

 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example 1:
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example 2:
 Input: "cbbd"
 Output: "bb"
 */

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty || s.count == 1 {
            return s
        }
        
        let sChars = [Character](s)
        
        // (left, maxLength)
        var result: (Int, Int) = (0, 0)

        for i in 0 ..< s.count {
            if extendPalindrome(sChars, i, i, result.1) != nil {
                result = extendPalindrome(sChars, i, i, result.1)! // Odd cases
            }
            if extendPalindrome(sChars, i, i+1, result.1) != nil {
                result = extendPalindrome(sChars, i, i+1, result.1)! // Even cases
            }
        }
        
        return String(sChars[result.0..<result.0 + result.1])
    }
    
    func extendPalindrome(_ sChars: [Character], _ left: Int, _ right: Int, _ currentMaxLength: Int) -> (Int, Int)? {
        var l = left
        var r = right
        while l >= 0 && r < sChars.count
        && sChars[l] == sChars[r] {
            l -= 1
            r += 1
        }

        var result = (0, 0)
        if currentMaxLength < (r - l + 1 - 2) {
            result.0 = l + 1
            result.1 = r - l + 1 - 2
            return result
        } else {
            return nil
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
        let results = solution.longestPalindrome("babad")
        XCTAssertEqual(results, "bab")
    }
    
    func testExample2() {
        let results = solution.longestPalindrome("cbbd")
        XCTAssertEqual(results, "bb")
    }
}

SolutionTests.defaultTestSuite.run()
