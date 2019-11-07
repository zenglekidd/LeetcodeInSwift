import Cocoa
/*
 55. Jump Game
 Medium

 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Determine if you are able to reach the last index.

 Example 1:
 Input: [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 
 Example 2:
 Input: [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum
              jump length is 0, which makes it impossible to reach the last index.
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        }
        
        var farest = 0
        for i in 0 ..< nums.count {
            if farest < i {
                return false
            }
            
            farest = max(i + nums[i], farest)
        }
        
        return true
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
        let results = solution.canJump([2,3,1,1,4])
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let results = solution.canJump([3,2,1,0,4])
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
