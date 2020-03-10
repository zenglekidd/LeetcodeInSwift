/*
https://leetcode.com/problems/longest-valid-parentheses/
32. Longest Valid Parentheses
Hard

Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

Example 1:
Input: "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()"
 
Example 2:
Input: ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()"
*/

import Foundation

class Solution {
	func longestValidParentheses(_ s: String) -> Int {
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
    
    //func testLeetcodeExample1() {
    //    XCTAssertEqual(<# Result #>, <# Expected Result #>)
    //}

}

SolutionTests.defaultTestSuite.run()
