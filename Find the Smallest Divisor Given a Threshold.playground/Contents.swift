import Cocoa
/*
 5281. Find the Smallest Divisor Given a Threshold
 
 Given an array of integers nums and an integer threshold, we will choose a positive integer divisor and divide all the array by it and sum the result of the division. Find the smallest divisor such that the result mentioned above is less than or equal to threshold.

 Each result of division is rounded to the nearest integer greater than or equal to that element. (For example: 7/3 = 3 and 10/2 = 5).

 It is guaranteed that there will be an answer.


 Example 1:
 Input: nums = [1,2,5,9], threshold = 6
 Output: 5
 Explanation: We can get a sum to 17 (1+2+5+9) if the divisor is 1.
 If the divisor is 4 we can get a sum to 7 (1+1+2+3) and if the divisor is 5 the sum will be 5 (1+1+1+2).
 
 Example 2:
 Input: nums = [2,3,5,7,11], threshold = 11
 Output: 3
 
 Example 3:
 Input: nums = [19], threshold = 5
 Output: 4
  
 Constraints:
 1 <= nums.length <= 5 * 10^4
 1 <= nums[i] <= 10^6
 nums.length <= threshold <= 10^6
 */

class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var result = Int.max
        let sortedNums = nums.sorted()
        var upperBound = sortedNums.last!
        var lowerBound = 0
        var currentDivisor = (lowerBound + upperBound) / 2
        while currentDivisor != upperBound &&
            currentDivisor != lowerBound {
            if isValidDivisor(nums, currentDivisor, threshold) {
                result = min(result, currentDivisor)
                upperBound = currentDivisor
                currentDivisor = (lowerBound + currentDivisor) / 2
            } else {
                lowerBound = currentDivisor
                currentDivisor = (upperBound + currentDivisor) / 2
            }
        }
        return result == Int.max ? sortedNums.last! : result
    }
    
    func isValidDivisor(_ nums: [Int], _ divisor: Int, _ threshold: Int) -> Bool {
        var sum = 0
        for n in nums {
            sum += Int(ceil(Double(n) / Double(divisor)))
        }
        return sum <= threshold
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
        let results = solution.smallestDivisor([1,2,5,9], 6)
        XCTAssertEqual(results, 5)
    }

    func testExample2() {
        let results = solution.smallestDivisor([2,3,5,7,11], 11)
        XCTAssertEqual(results, 3)
    }

    func testExample3() {
        let results = solution.smallestDivisor([19], 5)
        XCTAssertEqual(results, 4)
    }

    func testExample4() {
        let results = solution.smallestDivisor([5,7,8,2,3], 5)
        XCTAssertEqual(results, 8)
    }

    func testExample5() {
        let results = solution.smallestDivisor([36], 6)
        XCTAssertEqual(results, 6)
    }
    
    func testExample6() {
        let results = solution.smallestDivisor([1,2,3,10], 20)
        XCTAssertEqual(results, 1)
    }
}

SolutionTests.defaultTestSuite.run()
