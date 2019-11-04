/*
 70. Climbing Stairs
 Easy

 You are climbing a stair case. It takes n steps to reach to the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Note: Given n will be a positive integer.

 Example 1:

 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

class Solution {
    func climbStairs(_ n: Int) -> Int {
        // How many ways to reach the n-1 steps, n-2 steps
        // N step is n-1 steps + 1, n-2 steps + 2
        if n == 1 {
            return 1
        }
        
        var counters = Array(repeating: 0, count: n + 1)
        counters[0] = 1
        counters[1] = 1
        
        for i in 2 ... n {
            counters[i] = counters[i - 1] + counters[i - 2]
        }
        
        return counters[n]
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
        let results = solution.climbStairs(2)
        XCTAssertEqual(results, 2)
    }
    
    func testExample2() {
        let results = solution.climbStairs(3)
        XCTAssertEqual(results, 3)
    }
}

SolutionTests.defaultTestSuite.run()
