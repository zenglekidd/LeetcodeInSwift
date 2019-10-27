import UIKit

/*
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

 Example:

 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Note: Please solve it without division and in O(n).
 */
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var productsFromBeginning: [Int] = []
        var productsFromEnding: [Int] = []
        var product: [Int] = []
        
        var begin = 1
        var end = 1
        for i in 0..<nums.count {
            productsFromBeginning.append(begin)
            begin *= nums[i]
            
            productsFromEnding.append(end)
            end *= nums[nums.count - 1 - i]
        }
        
        productsFromEnding = productsFromEnding.reversed()
        
        for i in 0..<nums.count {
            product.append( productsFromBeginning[i] * productsFromEnding[i] )
        }
        
        return product
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
    
    func testExampleData() {
        let results = solution.productExceptSelf([2,3,4,5])
        XCTAssertEqual(results, [60,40,30,24])
    }
}

SolutionTests.defaultTestSuite.run()
