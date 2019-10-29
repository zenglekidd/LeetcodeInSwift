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
                if nums.count == 1 {
                    return nums[0]
                }
                
                var maxSoFar = nums[0]
                var maxEndingHere = nums[0]
                var minEndingHere = nums[0]
        
                for i in 1..<nums.count {
                    let temp = maxEndingHere
                    maxEndingHere = max(minEndingHere * nums[i], maxEndingHere * nums[i], nums[i])
                    minEndingHere = min(temp * nums[i], minEndingHere * nums[i], nums[i])
                    if maxEndingHere > maxSoFar {
                        maxSoFar = maxEndingHere
                    }
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
        let results = solution.maxProduct([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssertEqual(results, 960)
    }

    func testExample2() {
        let results = solution.maxProduct([-2,0,-1])
        XCTAssertEqual(results, 0)
    }

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

    func testExample6() {
        let results = solution.maxProduct([2,3,-2,4])
        XCTAssertEqual(results, 6)
    }

    func testExample7() {
        let results = solution.maxProduct([-1, 0])
        XCTAssertEqual(results, 0)
    }

    func testExample8() {
        let results = solution.maxProduct([1, 0])
        XCTAssertEqual(results, 1)
    }

    func testExample9() {
        let results = solution.maxProduct([3,-1,4])
        XCTAssertEqual(results, 4)
    }

    func testExample10() {
        let results = solution.maxProduct([2,-5,-2,-4,3])
        XCTAssertEqual(results, 24)
    }
}

SolutionTests.defaultTestSuite.run()
