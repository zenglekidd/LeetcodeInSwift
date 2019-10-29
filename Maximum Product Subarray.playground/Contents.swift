/*
 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

 Example 1:

 Input: [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:

 Input: [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 */

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = 1
        var maxProductEndHere = 1
        for i in 0..<nums.count {
            maxProductEndHere = max(nums[i], maxProductEndHere * nums[i])
            maxProduct = max(maxProduct, maxProductEndHere)
        }
        return maxProduct
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
        let results = solution.maxProduct([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssertEqual(results, 960)
    }
    
//    func testExample2() {
//        let results = solution.maxProduct([31,-41,59,26,-53,58,97,-93,-23,84])
//        XCTAssertEqual(results, 0)
//    }
    
    func testExample3() {
        let results = solution.maxProduct([-1])
        XCTAssertEqual(results, -1)
    }
    
    func testExample4() {
        let results = solution.maxProduct([1,2,3,4])
        XCTAssertEqual(results, 24)
    }
    
    func testExample5() {
        let results = solution.maxProduct([-3,-2,-1,-4])
        XCTAssertEqual(results, 24)
    }
}

SolutionTests.defaultTestSuite.run()
