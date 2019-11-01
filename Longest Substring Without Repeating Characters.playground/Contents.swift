import UIKit

/*
 3. Longest Substring Without Repeating Characters
 Medium

 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count < 1 {
            return 0
        }

        var head: Int = 0
        var dict: [Character : Int] = [:]
        var maxSoFar: Int = 0
        
        for tail in 0 ..< s.count {
            let index = s.index(s.startIndex, offsetBy: tail)
            if dict[s[index]] != nil {
                head = max(head, dict[s[index]]! + 1)
            }
            
            dict[s[index]] = tail
            maxSoFar = max(maxSoFar, tail - head + 1)
        }

        return maxSoFar
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
        let results = solution.lengthOfLongestSubstring("abcabcbb")
        XCTAssertEqual(results, 3)
    }

    func testExample2() {
        let results = solution.lengthOfLongestSubstring("bbbbb")
        XCTAssertEqual(results, 1)
    }

    func testExample3() {
        let results = solution.lengthOfLongestSubstring("pwwkew")
        XCTAssertEqual(results, 3)
    }

    func testExample4() {
        let results = solution.lengthOfLongestSubstring("p")
        XCTAssertEqual(results, 1)
    }

    func testExample5() {
        let results = solution.lengthOfLongestSubstring("pwk")
        XCTAssertEqual(results, 3)
    }

    func testExample6() {
        let results = solution.lengthOfLongestSubstring("pwwk")
        XCTAssertEqual(results, 2)
    }

    func testExample7() {
        let results = solution.lengthOfLongestSubstring("pwkk")
        XCTAssertEqual(results, 3)
    }
    
    func testExample8() {
        let results = solution.lengthOfLongestSubstring("abba")
        XCTAssertEqual(results, 2)
    }
}

SolutionTests.defaultTestSuite.run()

