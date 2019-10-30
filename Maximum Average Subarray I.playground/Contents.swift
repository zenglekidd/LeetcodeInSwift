/*
 643. Maximum Average Subarray I
 Easy

 Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.

 Example 1:

 Input: [1,12,-5,-6,50,3], k = 4
 Output: 12.75
 Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75
  

 Note:
 1 <= k <= n <= 30,000.
 Elements of the given array will be in the range [-10,000, 10,000].
 */


class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return Double(nums[0])
        }
        
        var sum = 0
        for i in 0..<k {
            sum += nums[i]
        }
        var maxAverage = Double(sum) / Double(k)
        var endingHere = Double(sum) / Double(k)
        
        for i in k ..< nums.count {
            endingHere = endingHere + Double(nums[i] - nums[i-k]) / Double(k)
            
            if nums[i] >= nums[i - k] {
                maxAverage = max(maxAverage, endingHere)
            }
        }
        
        return maxAverage
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
        let results = solution.findMaxAverage([0,4,0,3,2], 1)
        XCTAssertEqual(results, 4)
    }
    
    func testExample2() {
        let results = solution.findMaxAverage([6,8,6,8,0,4,1,2,9,9], 2)
        XCTAssertEqual(results, 9.0)
    }
}

SolutionTests.defaultTestSuite.run()
