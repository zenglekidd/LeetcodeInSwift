/*
 1143. Longest Common Subsequence
 Medium

 Given two strings text1 and text2, return the length of their longest common subsequence.

 A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

 If there is no common subsequence, return 0.

 Example 1:
 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 
 Example 2:
 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 
 Example 3:
 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var lengthArray: [[Int]] = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: 2)
        for i in 1 ... text1.count {
            for j in 1 ... text2.count {
                if text1[text1.index(text1.startIndex, offsetBy: i-1)] ==
                    text2[text2.index(text2.startIndex, offsetBy: j-1)]{
                    lengthArray[i % 2][j] = lengthArray[(i-1) % 2][j-1] + 1
                } else {
                    lengthArray[i % 2][j] = max(lengthArray[i % 2][j-1], lengthArray[(i-1) % 2][j])
                }
            }
        }
        
        return lengthArray[text1.count % 2][text2.count]
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
        let results = solution.longestCommonSubsequence("abcde", "ace")
        XCTAssertEqual(results, 3)
    }
    
    func testExample2() {
        let results = solution.longestCommonSubsequence("abc", "abc")
        XCTAssertEqual(results, 3)
    }

    func testExample3() {
        let results = solution.longestCommonSubsequence("abc", "def")
        XCTAssertEqual(results, 0)
    }

    func testExample4() {
        let results = solution.longestCommonSubsequence("abcde", "aceabcde")
        XCTAssertEqual(results, 5)
    }

    func testExample5() {
        let results = solution.longestCommonSubsequence("ezupkr", "ubmrapg")
        XCTAssertEqual(results, 2)
    }
}

SolutionTests.defaultTestSuite.run()
