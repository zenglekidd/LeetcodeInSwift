/*
 5124. Sequential Digits

 An integer has sequential digits if and only if each digit in the number is one more than the previous digit.

 Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.

  

 Example 1:

 Input: low = 100, high = 300
 Output: [123,234]
 Example 2:

 Input: low = 1000, high = 13000
 Output: [1234,2345,3456,4567,5678,6789,12345]
  

 Constraints:

 10 <= low <= high <= 10^9
 */

import Foundation

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var result: [Int] = []
        
        for item in totalSequential() {
            if item >= low && item <= high {
                result.append(item)
            }
        }
        
        return result
    }
    
    func totalSequential() -> [Int] {
        var result: [Int] = []
        for i in 2...9 {
            result.append(contentsOf: allSequential(length: i))
        }
        return result
    }
    
    func allSequential(length: Int) -> [Int] {
        if length < 2 {
            return []
        }
        
        if length > 9 {
            return []
        }
        
        var result: [Int] = []
        
        for i in 1...(9 - length + 1) {
            var lengthToGive = length
            var currentDigit = i
            var value = 0
            while lengthToGive > 0 {
                value = value * 10 + currentDigit
                currentDigit += 1
                lengthToGive -= 1
            }
            result.append(value)
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
    
    func testExample1() {
        let results = solution.sequentialDigits(100,300)
        XCTAssertEqual(results, [123,234])
    }

    func testExample2() {
        let results = solution.sequentialDigits(1000,13000)
        XCTAssertEqual(results, [1234,2345,3456,4567,5678,6789,12345])
    }
    
//    func testExample3() {
//        let results = solution.numberOfDigits(1000)
//        XCTAssertEqual(results.0, 4)
//        XCTAssertEqual(results.1, 1)
//    }
//
//    func testExample4() {
//        let results = solution.numberOfDigits(13000)
//        XCTAssertEqual(results.0, 5)
//        XCTAssertEqual(results.1, 1)
//    }
//
//    func testExample5() {
//        let results = solution.numberOfDigits(10)
//        XCTAssertEqual(results.0, 2)
//        XCTAssertEqual(results.1, 1)
//    }
    
//    func testExample6() {
//        let results = solution.allSequential(length: 7)
//        XCTAssertEqual(results, [])
//    }
    
    func testExample7() {
        let results = solution.totalSequential()
        XCTAssertEqual(results, [])
    }
}

SolutionTests.defaultTestSuite.run()
