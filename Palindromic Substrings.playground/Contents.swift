/*
 647. Palindromic Substrings
 Medium

 Given a string, your task is to count how many palindromic substrings in this string.

 The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

 Example 1:
 Input: "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
  
 Example 2:
 Input: "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
 */

import Foundation

class Solution {
    func countSubstrings(_ s: String) -> Int {
        if s.count < 2 {
            return 1
        }
        
        let sChars = [Character](s)
        var count = 0
        
        for i in 0 ..< s.count {
            count += extendPalindrome(sChars, i, i)
            count += extendPalindrome(sChars, i, i+1)
        }
        
        return count
    }
    
    func extendPalindrome(_ sChars: [Character], _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        var count = 0
        while l >= 0 && r < sChars.count
        && sChars[l] == sChars[r] {
            l -= 1
            r += 1
            count += 1
        }

        return count
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
        let results = solution.countSubstrings("abc")
        XCTAssertEqual(results, 3)
    }

    func testExample2() {
        let results = solution.countSubstrings("aaa")
        XCTAssertEqual(results, 6)
    }
}

SolutionTests.defaultTestSuite.run()
