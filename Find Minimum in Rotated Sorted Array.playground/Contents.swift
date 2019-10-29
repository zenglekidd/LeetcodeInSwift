/*
 153. Find Minimum in Rotated Sorted Array
 Medium

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.

 You may assume no duplicate exists in the array.

 Example 1:
 Input: [3,4,5,1,2]
 Output: 1
 
 Example 2:
 Input: [4,5,6,7,0,1,2]
 Output: 0
 
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return (nums[0] > nums[1]) ? nums[1] : nums[0]
        }
        
        let middle = nums.count / 2
        
        // Find in left
        let leftMin = findMin(Array(nums[0..<middle]))
        
        // Find in right
        let rightMin = findMin(Array(nums[middle..<nums.count]))
            
        return min(leftMin, rightMin)
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
    
    func testExample0() {
        let results = solution.findMin([3,4])
        XCTAssertEqual(results, 3)
    }
    
    func testExample1() {
        let results = solution.findMin([3,4,5,1,2])
        XCTAssertEqual(results, 1)
    }

    func testExample2() {
        let results = solution.findMin([4,5,6,7,0,1,2])
        XCTAssertEqual(results, 0)
    }
}

SolutionTests.defaultTestSuite.run()
