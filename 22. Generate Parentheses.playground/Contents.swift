/*
https://leetcode.com/problems/generate-parentheses/
22. Generate Parentheses
Medium

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
*/

import Foundation

class Solution {
	func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {return []}
        
        var result: [String] = []
        helper(0, left: n, right: n, "", &result)
        return result
    }
    
    func helper(_ index: Int, left: Int, right: Int, _ carry: String, _ result: inout [String]) {
        if right == 0 {
            result.append(carry)
        }
            
        if left > 0 {
            helper(index + 1, left: left - 1, right: right, carry + "(", &result)
        }
            
        if (right > left) {
            helper(index + 1, left: left, right: right - 1, carry + ")", &result)
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
    
    func testLeetcodeExample1() {
        XCTAssertEqual(solution.generateParenthesis(3), [
          "((()))",
          "(()())",
          "(())()",
          "()(())",
          "()()()"
        ])
    }

}

SolutionTests.defaultTestSuite.run()
