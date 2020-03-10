/*
https://leetcode.com/problems/unique-binary-search-trees/
96. Unique Binary Search Trees
Medium

Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

Example:
Input: 3
Output: 5
Explanation:
Given n = 3, there are a total of 5 unique BST's:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
*/

import Foundation

class Solution {
	func numTrees(_ n: Int) -> Int {
        if n == 0 {return 1}
        
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in 2 ... n {
            for j in 1 ... i {
                dp[i] += dp[j-1] * dp[i-j]
            }
        }
        return dp[n]
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
    
//    func testLeetcodeExample0() {
//        XCTAssertEqual(solution.numTrees(2), 2)
//    }
//
//    func testLeetcodeExample1() {
//        XCTAssertEqual(solution.numTrees(3), 5)
//    }
//
//    func testLeetcodeExample2() {
//        XCTAssertEqual(solution.numTrees(4), 14)
//    }
    
    func testLeetcodeExample3() {
        XCTAssertEqual(solution.numTrees(5), 42)
    }
    
//    func testLeetcodeExample4() {
//        XCTAssertEqual(solution.numTrees(19), 1767263190)
//    }
}

SolutionTests.defaultTestSuite.run()
