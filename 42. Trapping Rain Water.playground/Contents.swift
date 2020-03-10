/*
https://leetcode.com/problems/trapping-rain-water/
42. Trapping Rain Water
Hard

Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

Example:
Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
*/

import Foundation

class Solution {
	func trap(_ height: [Int]) -> Int {
        var start = 0
        var end = 0
        
        while start != height.count {
            start = firstDecline(height, start: start)
            end = firstDecline(height, start: start)
            
            print(start)
            print(end)
            
            start = end
        }

        return 0
    }
    
    func firstDecline(_ height: [Int], start: Int) -> Int {
        var currentValue = 0
        var result = height.count
        for i in start ..< height.count - 1{
            if currentValue > height[i+1] {
                result = i
                break
            }
            currentValue = height[i+1]
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
    
    func testLeetcodeExample1() {
        let input = [0,1,0,2,1,0,1,3,2,1,2,1]
        XCTAssertEqual(solution.trap(input), 6)
    }

}

SolutionTests.defaultTestSuite.run()
