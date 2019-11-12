import Cocoa
/*
 50. Pow(x, n)
 Medium

 Implement pow(x, n), which calculates x raised to the power n (xn).

 Example 1:

 Input: 2.00000, 10
 Output: 1024.00000
 Example 2:

 Input: 2.10000, 3
 Output: 9.26100
 Example 3:

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 Note:

 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 */

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
         if x == 0 {
             return 0
         }

         var result: Double
         if x > 0 {
             result = powPositive(x, n)
         } else {
             let product: Double = (n % 2 == 0) ? 1 : -1
             result = powPositive(x * -1, n) * product
         }
         return Double(round(result * 100000) / 100000)
     }
     
     private func powPositive(_ x: Double, _ n: Int) -> Double{
         if x <= 0 {
             return 0
         } else if x == 1 {
            return 1
        }

         var product: Double = 1
         for _ in 0 ..< abs(n) {
            product = product * x
            
            if product < 0.00001 || 1 / product < 0.00001 {
                return 0
            }
         }
         
         if n > 0 {
             return product
         } else if n == 0 {
             return 1
         } else {
             return 1 / product
         }
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
        let results = solution.myPow(2.00000, 10)
        XCTAssertEqual(results, 1024.00000)
    }

    func testExample2() {
        let results = solution.myPow(2.10000, 3)
        XCTAssertEqual(results, 9.26100)
    }

    func testExample3() {
        let results = solution.myPow(2.00000, -2)
        XCTAssertEqual(results, 0.25000)
    }

    func testExample4() {
        let results = solution.myPow(2.00000, -2)
        XCTAssertEqual(results, 0.25000)
    }

    func testExample5() {
        let results = solution.myPow(0, -2)
        XCTAssertEqual(results, 0)
    }

    func testExample6() {
        let results = solution.myPow(2985, 0)
        XCTAssertEqual(results, 1)
    }

    func testExample7() {
        let results = solution.myPow(-5.62800, -3)
        XCTAssertEqual(results, -0.00561)
    }

    func testExample8() {
        let results = solution.myPow(-2.00000, 4)
        XCTAssertEqual(results, 16.00000)
    }
    
    func testExample9() {
        let results = solution.myPow(0.00001, 2147483647)
        XCTAssertEqual(results, 0)
    }
    
    func testExample10() {
        let results = solution.myPow(1.00000, 2147483647)
        XCTAssertEqual(results, 1.00000)
    }
    
    func testExample11() {
        let results = solution.myPow(2.00000, -2147483648)
        XCTAssertEqual(results, 0)
    }
}

SolutionTests.defaultTestSuite.run()
