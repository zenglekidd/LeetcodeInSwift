/*
 33. Search in Rotated Sorted Array
 Medium

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        if nums.count < 1 {
            return (nums[0] == target) ? 0 : -1
        }
        
        let middle = nums.count / 2
        let leftArray = Array(nums[0..<middle])
        let rightArray = Array(nums[middle..<nums.count])

        // It will in either left or right array, can't be both
        let leftIndex = search(leftArray, target)
        var rightIndex = search(rightArray, target)
        
        if leftIndex == -1 && rightIndex == -1 {
            return -1
        }
        
        if leftIndex == -1 {
            rightIndex += leftArray.count
            return rightIndex
        }
        
        return leftIndex
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
        let results = solution.search([4,5,6,7,0,1,2], 0)
        XCTAssertEqual(results, 4)
    }

    func testExample2() {
        let results = solution.search([4,5,6,7,0,1,2], 3)
        XCTAssertEqual(results, -1)
    }
    
    func testExample3() {
        let results = solution.search([4,5], 4)
        XCTAssertEqual(results, 0)
    }
    
    func testExample4() {
        let results = solution.search([4,5], 5)
        XCTAssertEqual(results, 1)
    }
    
    func testExample5() {
        let results = solution.search([4,5], 6)
        XCTAssertEqual(results, -1)
    }
    
    func testExample6() {
        let results = solution.search([], 5)
        XCTAssertEqual(results, -1)
    }
}

SolutionTests.defaultTestSuite.run()
