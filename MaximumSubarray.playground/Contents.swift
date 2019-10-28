import UIKit

/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum: Int = Int.min
        var maxSumEndHere: Int = 0
        for i in 0..<nums.count {
            maxSumEndHere = max(nums[i], maxSumEndHere + nums[i])
            maxSum = max(maxSum, maxSumEndHere)
        }
        
        return maxSum
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
        let results = solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssertEqual(results, 6)
    }
    
    func testExample2() {
        let results = solution.maxSubArray([31,-41,59,26,-53,58,97,-93,-23,84])
        XCTAssertEqual(results, 187)
    }
    
    func testExample3() {
        let results = solution.maxSubArray([-1])
        XCTAssertEqual(results, -1)
    }
    
    func testExample4() {
        let results = solution.maxSubArray([1,2,3,4])
        XCTAssertEqual(results, 10)
    }
    
    func testExample5() {
        let results = solution.maxSubArray([-3,-2,-1,-4])
        XCTAssertEqual(results, -1)
    }
}

SolutionTests.defaultTestSuite.run()
