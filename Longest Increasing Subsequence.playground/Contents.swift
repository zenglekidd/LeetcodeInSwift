/*
 300. Longest Increasing Subsequence
 Medium

 Given an unsorted array of integers, find the length of longest increasing subsequence.

 Example:

 Input: [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Note:

 There may be more than one LIS combination, it is only necessary for you to return the length.
 Your algorithm should run in O(n2) complexity.
 Follow up: Could you improve it to O(n log n) time complexity?
 */

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count < 1 {
            return 0
        } else if nums.count == 1 {
            return 1
        }
        
        var lengthArray:[Int] = Array(repeating: 1, count: nums.count)
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    lengthArray[i] = max(lengthArray[i], lengthArray[j] + 1)
                }
            }
        }
        
        var longest = Int.min
        for i in 0 ..< nums.count {
            if lengthArray[i] > longest {
                longest = lengthArray[i]
            }
        }
        
        return longest
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
        let results = solution.lengthOfLIS([10,9,2,5,3,7,101,18])
        XCTAssertEqual(results, 4)
    }
    
    func testExample2() {
        let results = solution.lengthOfLIS([10,9,2,5,3,4])
        XCTAssertEqual(results, 3)
    }
}

SolutionTests.defaultTestSuite.run()
