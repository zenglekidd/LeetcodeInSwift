/*
268. Missing Number
Easy

Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

Example 1:

Input: [3,0,1]
Output: 2
Example 2:

Input: [9,6,4,2,3,5,7,0,1]
Output: 8
Note:
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
*/

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var v = nums.count
        for i in 0..<nums.count {
            v = v ^ i ^ nums[i]
        }
        return v
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
        let input = [3,0,1]
        XCTAssertEqual(solution.missingNumber(input), 2)
    }
    
    func testExample2() {
        let input = [9,6,4,2,3,5,7,0,1]
        XCTAssertEqual(solution.missingNumber(input), 8)
    }

}

SolutionTests.defaultTestSuite.run()
