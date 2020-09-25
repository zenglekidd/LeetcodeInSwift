import UIKit

/*
 You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

 Return the max sliding window.

 Example 1:

 Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
 Output: [3,3,5,5,6,7]
 Explanation:
 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
 Example 3:

 Input: nums = [1,-1], k = 1
 Output: [1,-1]
 Example 4:

 Input: nums = [9,11], k = 2
 Output: [11]
 Example 5:

 Input: nums = [4,-2], k = 2
 Output: [4]
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length
 */

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k > nums.count { return [] }
        if nums.count == 0 { return [] }
        
        var result: [Int] = []
        var indexQueue: [Int] = []
        
        for i in 0 ..< nums.count {
            let start = i - k + 1
            if indexQueue.count != 0, start > indexQueue.first! {
                indexQueue.removeFirst()
            }
            
            while indexQueue.count != 0, nums[i] >= nums[indexQueue.last!] {
                indexQueue.removeLast()
            }
            
            indexQueue.append(i)
            
            if start >= 0 {
                let currentMax = nums[indexQueue.first!]
                result.append(currentMax)
            }
        }
        
        return result
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
    
    func test1() {
        let inputs = [1,3,-1,-3,5,3,6,7]
        let outputs = [3,3,5,5,6,7]
        let results = solution.maxSlidingWindow(inputs, 3)
        XCTAssertEqual(results, outputs)
    }
    
    func test2() {
        let inputs = [1]
        let outputs = [1]
        let results = solution.maxSlidingWindow(inputs, 1)
        XCTAssertEqual(results, outputs)
    }
    
    func test3() {
        let inputs = [1,-1]
        let outputs = [1,-1]
        let results = solution.maxSlidingWindow(inputs, 1)
        XCTAssertEqual(results, outputs)
    }
    
    func test4() {
        let inputs = [9,11]
        let outputs = [11]
        let results = solution.maxSlidingWindow(inputs, 2)
        XCTAssertEqual(results, outputs)
    }
}

SolutionTests.defaultTestSuite.run()
