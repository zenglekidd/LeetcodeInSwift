/* https://leetcode.com/problems/regular-expression-matching/
10. Regular Expression Matching
Hard

Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.

'.' Matches any single character.
'*' Matches zero or more of the preceding element.
The matching should cover the entire input string (not partial).

Note:
s could be empty and contains only lowercase letters a-z.
p could be empty and contains only lowercase letters a-z, and characters like . or *.
*/

import Foundation

class Solution {
	func isMatch(_ s: String, _ p: String) -> Bool {
        if s.isEmpty { return false }
        if p.isEmpty { return true }
        
        let sArray = Array(s)
        let pArray = Array(p)
        
        var j = 0
        var pattern: Character? = pArray[0]
        for i in 0 ..< s.count {
            if j >= pArray.count { return false}
            
            if (pArray[j] != "*") && (sArray[i] == pattern || pattern == ".") {
                pattern = pArray[j]
                j += 1
            }
        }
        
        return true
    }
    
    func helper(_ c: Character, _ p: Character?) -> Bool {
        if p == nil { return true}
        
        if p == "." {return true}
        
        return c == p!
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
        let s = "aa"
        let p = "a"
        XCTAssertEqual(solution.isMatch(s, p), false)
    }

    func testLeetcodeExample2() {
        let s = "aa"
        let p = "a*"
        XCTAssertEqual(solution.isMatch(s, p), true)
    }

    func testLeetcodeExample3() {
        let s = "ab"
        let p = ".*"
        XCTAssertEqual(solution.isMatch(s, p), true)
    }

    func testLeetcodeExample4() {
        let s = "aab"
        let p = "c*a*b"
        XCTAssertEqual(solution.isMatch(s, p), true)
    }

//    func testLeetcodeExample5() {
//        let s = "mississippi"
//        let p = "mis*is*p*."
//        XCTAssertEqual(solution.isMatch(s, p), false)
//    }
}

SolutionTests.defaultTestSuite.run()
