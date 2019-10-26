import UIKit

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        
        var results: Set<[Int]> = []
        
        var zeroCount = 0
        let numSorted = nums.sorted()
        for (index1, num1) in numSorted.enumerated() {

            if num1 == 0 {
                zeroCount += 1
            }
            if zeroCount > 3 {
                continue
            }
            
            let subArray = Array(numSorted.dropFirst(index1+1))
            let twoSumResults = twoSum(subArray, -num1)
            if twoSumResults != [] {
                for twoSumResult in twoSumResults {
                    var array = [num1]
                    array.append(contentsOf: twoSumResult)
                    let sortedArray = array.sorted()
                    results.insert(sortedArray)
                }
            }
        }
        
        let unsorted = Array(results)
        return sortArrayOfArray(unsorted)
    }
    
    fileprivate func sortArrayOfArray(_ unsorted: [[Int]]) -> [[Int]] {
        let sorted = unsorted.sorted {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else if $0[1] != $1[1] {
                return $0[1] < $1[1]
            } else {
                return $0[2] < $1[2]
            }
        }
        return sorted
    }

    fileprivate func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var dict: [Int: Int] = [:]
        var results : [[Int]] = []

        for (index, num) in nums.enumerated() {
            if dict[num] != nil {
                results.append([nums[dict[num]!], num])
            }
            
            dict[target - num] = index
        }
        
        return results
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
    
    func testTwoElements() {
        let results = solution.threeSum([-1, 1])
        XCTAssertEqual(results, [])
    }

    func testThreeElementsNotFounded() {
        let results = solution.threeSum([-2, -1, 0])
        XCTAssertEqual(results, [])
    }

    func testThreeElementsFounded() {
        let results = solution.threeSum([-1, 0, 1])
        XCTAssertEqual(results, [[-1, 0, 1]])
    }

    func testFourElementsNotFounded() {
        let results = solution.threeSum([2, 3, 4, 5])
        XCTAssertEqual(results, [])
    }

    func testFourElementsFounded() {
        let results = solution.threeSum([-2, -1, 0 , 1])
        XCTAssertEqual(results, [[-1, 0, 1]])
    }

    func testFiveElementsTwoFounded() {
        let results = solution.threeSum([-2, -1, 0 , 1, 2])
        XCTAssertEqual(results, [[-2, 0, 2], [-1, 0, 1]])
    }

    func testExampleData() {
        let results = solution.threeSum([-1, 0, 1, 2, -1, -4])
        XCTAssertEqual(results, [
            [-1, -1, 2],
            [-1, 0, 1]
        ])
    }
    
    func testMoreExampleData() {
        let input = [3,-9,3,9,-6,-1,-2,8,6, -7, -14]

        let results = solution.threeSum(input)
        XCTAssertEqual(results, [
          [-14, 6, 8],
          [-9, 3, 6],
          [-7,-2, 9],
          [-7, -1, 8],
          [-6, -2, 8],
          [-6, 3, 3],
          [-2, -1, 3],
        ])
    }

    func testAlotOfZerosExampleData() {
        let input = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

        let results = solution.threeSum(input)
        XCTAssertEqual(results, [
          [0, 0, 0]
        ])
    }
    
    
    func testBigSampleSize() {
        let input = [-4,-8,7,13,10,1,-14,-13,0,8,6,-13,-5,-4,-12,2,-11,7,-5,0,-9,-14,-8,-9,2,-7,-13,-3,13,9,-14,-6,8,1,14,-5,-13,8,-10,-5,1,11,-11,3,14,-8,-10,-12,6,-8,-5,13,-15,2,11,-5,10,6,-1,1,0,0,2,-7,8,-6,3,3,-13,8,5,-5,-3,9,5,-4,-14,11,-8,7,10,-6,-3,11,12,-14,-9,-1,7,5,-15,14,12,-5,-8,-2,4,2,-14,-2,-12,6,8,0,0,-2,3,-7,-14,2,7,12,12,12,0,9,13,-2,-15,-3,10,-14,-4,7,-12,3,-10]

        let results = solution.threeSum(input)
        XCTAssertEqual(results, [[-15,1,14],[-15,2,13],[-15,3,12],[-15,4,11],[-15,5,10],[-15,6,9],[-15,7,8],[-14,0,14],[-14,1,13],[-14,2,12],[-14,3,11],[-14,4,10],[-14,5,9],[-14,6,8],[-14,7,7],[-13,-1,14],[-13,0,13],[-13,1,12],[-13,2,11],[-13,3,10],[-13,4,9],[-13,5,8],[-13,6,7],[-12,-2,14],[-12,-1,13],[-12,0,12],[-12,1,11],[-12,2,10],[-12,3,9],[-12,4,8],[-12,5,7],[-12,6,6],[-11,-3,14],[-11,-2,13],[-11,-1,12],[-11,0,11],[-11,1,10],[-11,2,9],[-11,3,8],[-11,4,7],[-11,5,6],[-10,-4,14],[-10,-3,13],[-10,-2,12],[-10,-1,11],[-10,0,10],[-10,1,9],[-10,2,8],[-10,3,7],[-10,4,6],[-10,5,5],[-9,-5,14],[-9,-4,13],[-9,-3,12],[-9,-2,11],[-9,-1,10],[-9,0,9],[-9,1,8],[-9,2,7],[-9,3,6],[-9,4,5],[-8,-6,14],[-8,-5,13],[-8,-4,12],[-8,-3,11],[-8,-2,10],[-8,-1,9],[-8,0,8],[-8,1,7],[-8,2,6],[-8,3,5],[-7,-7,14],[-7,-6,13],[-7,-5,12],[-7,-4,11],[-7,-3,10],[-7,-2,9],[-7,-1,8],[-7,0,7],[-7,1,6],[-7,2,5],[-7,3,4],[-6,-6,12],[-6,-5,11],[-6,-4,10],[-6,-3,9],[-6,-2,8],[-6,-1,7],[-6,0,6],[-6,1,5],[-6,2,4],[-6,3,3],[-5,-5,10],[-5,-4,9],[-5,-3,8],[-5,-2,7],[-5,-1,6],[-5,0,5],[-5,1,4],[-5,2,3],[-4,-4,8],[-4,-3,7],[-4,-2,6],[-4,-1,5],[-4,0,4],[-4,1,3],[-4,2,2],[-3,-3,6],[-3,-2,5],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-2,4],[-2,-1,3],[-2,0,2],[-2,1,1],[-1,-1,2],[-1,0,1],[0,0,0]])
    }
}

SolutionTests.defaultTestSuite.run()
