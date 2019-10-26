import UIKit

/*
217. Contains Duplicate
Easy

Given an array of integers, find if the array contains any duplicates.

Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

Example 1:
Input: [1,2,3,1]
Output: true
 
Example 2:
Input: [1,2,3,4]
Output: false
 
Example 3:
Input: [1,1,1,3,3,4,3,2,4,2]
Output: true
 */

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict: [Int: Bool] = [:]
        for num in nums {
            if dict[num] != nil {
                return true
            }
            dict[num] = true
        }
        return false
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
        let results = solution.containsDuplicate([1,2,3,1])
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let results = solution.containsDuplicate([1,2,3,4])
        XCTAssertEqual(results, false)
    }
    
    func testExample3() {
        let results = solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2])
        XCTAssertEqual(results, true)
    }
}

SolutionTests.defaultTestSuite.run()
