import UIKit

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {  
        var dict: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            if dict[num] != nil {
                return [dict[num]!, index]
            }
            
            dict[target - num] = index
        }
        
        return [-1]
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
    
    func testOneElements() {
        let results = solution.twoSum([2], 100)
        XCTAssertEqual(results, [-1])
    }
    
    func testTwoElementsNotFounded() {
        let results = solution.twoSum([2, 7], 100)
        XCTAssertEqual(results, [-1])
    }
    
    func testTwoElementsFounded() {
        let results = solution.twoSum([2, 7], 9)
        XCTAssertEqual(results, [0, 1])
    }
    
    func testThreeElementsNotFounded() {
        let results = solution.twoSum([2, 3, 4], 9)
        XCTAssertEqual(results, [-1])
    }
    
    func testThreeElementsFounded() {
        let results = solution.twoSum([2, 3, 4], 7)
        XCTAssertEqual(results, [1, 2])
    }
    
    func testThreeElementsRepeatElements() {
        let results = solution.twoSum([2, 3, 3], 6)
        XCTAssertEqual(results, [1, 2])
    }
    
    func testExampleData() {
        let results = solution.twoSum([2, 7, 11, 15], 9)
        XCTAssertEqual(results, [0, 1])
    }
}

SolutionTests.defaultTestSuite.run()
