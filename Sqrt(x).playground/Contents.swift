import Cocoa
/*
 69. Sqrt(x)
 Easy

 Implement int sqrt(int x).

 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

 Example 1:
 Input: 4
 Output: 2
 
 Example 2:
 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
              the decimal part is truncated, 2 is returned.
 */

class Solution {
    func mySqrt(_ x: Int) -> Int {
        for i in 1 ... (x / 2 + 1) {
            if i * i <= x && (i + 1) * (i + 1) > x {
                return i
            }
        }
        
        return 0
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
        let results = solution.mySqrt(4)
        XCTAssertEqual(results, 2)
    }
    
    func testExample2() {
        let results = solution.mySqrt(8)
        XCTAssertEqual(results, 2)
    }
    
    func testExample3() {
        let results = solution.mySqrt(0)
        XCTAssertEqual(results, 0)
    }
}

SolutionTests.defaultTestSuite.run()
