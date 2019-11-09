import Cocoa
/*
 377. Combination Sum IV
 Medium

 Given an integer array with all positive numbers and no duplicates, find the number of possible combinations that add up to a positive integer target.

 Example:
 nums = [1, 2, 3]
 target = 4

 The possible combination ways are:
 (1, 1, 1, 1)
 (1, 1, 2)
 (1, 2, 1)
 (1, 3)
 (2, 1, 1)
 (2, 2)
 (3, 1)

 Note that different sequences are counted as different combinations.

 Therefore the output is 7.
  

 Follow up:
 What if negative numbers are allowed in the given array?
 How does it change the problem?
 What limitation we need to add to the question to allow negative numbers?

 Credits:
 Special thanks to @pbrother for adding this problem and creating all test cases.
 */

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var count: [Int] = Array(repeating: 0, count: target + 1)
        let sortedNums = nums.sorted()
        
        count[0] = 1
        for i in 1 ... target {
            for j in 0 ..< sortedNums.count {
                if (i - sortedNums[j]) >= 0 {
                    if count[i] > 10000000000 {
                        count[i] = 0
                    } else {
                        count[i] += count[i - sortedNums[j]]
                    }
                }
            }
        }
        return count[target]
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
        let results = solution.combinationSum4([1, 2, 3], 4)
        XCTAssertEqual(results, 7)
    }

    func testExample2() {
        let results = solution.combinationSum4([1, 2, 3], 5)
        XCTAssertEqual(results, 13)
    }

    func testExample3() {
        let results = solution.combinationSum4([2, 3, 4], 1)
        XCTAssertEqual(results, 0)
    }

    func testExample4() {
        let results = solution.combinationSum4([3, 5, 7], 10)
        XCTAssertEqual(results, 3)
    }
    
    func testExample5() {
        let results = solution.combinationSum4([3, 33, 333], 10000)
        XCTAssertEqual(results, 0)
    }
    
    func testExample6() {
        let results = solution.combinationSum4([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100], 31)
        XCTAssertEqual(results, 1073741824)
    }
    
    
}

SolutionTests.defaultTestSuite.run()
