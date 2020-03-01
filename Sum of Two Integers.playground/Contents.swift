/*
371. Sum of Two Integers
Easy

Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.

Example 1:
Input: a = 1, b = 2
Output: 3
 
Example 2:
Input: a = -2, b = 3
Output: 1
*/

import Foundation

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var carry = a & b
        let remainder = a ^ b
        carry = carry << 1

        if carry & remainder != 0 {
            return getSum(carry, remainder)
        }
        return carry | remainder
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
        XCTAssertEqual(solution.getSum(1, 2), 3)
    }

//    func testExample2() {
//        XCTAssertEqual(solution.getSum(-2, 3), 1)
//    }
//
//    func testExample3() {
//        XCTAssertEqual(solution.getSum(8, 8), 16)
//    }
}

SolutionTests.defaultTestSuite.run()
