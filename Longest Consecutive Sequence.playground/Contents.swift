/*
 128. Longest Consecutive Sequence
 Hard

 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

 Your algorithm should run in O(n) complexity.

 Example:
 Input: [100, 4, 200, 1, 3, 2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 */

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set: Set = Set(nums)
        var maxCount: Int = 0
        
        for item in set {
            var next = item
            var count = 0
            while set.contains(next) {
                next += 1
                count += 1
            }
            maxCount = count > maxCount ? count : maxCount
        }
        
        return maxCount
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
        let nums = [100, 4, 200, 1, 3, 2]
        XCTAssertEqual(solution.longestConsecutive(nums), 4)
     }

}

SolutionTests.defaultTestSuite.run()
