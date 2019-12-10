import Foundation
/*
 5279. Subtract the Product and Sum of Digits of an Integer
 
 Given an integer number n, return the difference between the product of its digits and the sum of its digits.
  
 Example 1:

 Input: n = 234
 Output: 15
 Explanation:
 Product of digits = 2 * 3 * 4 = 24
 Sum of digits = 2 + 3 + 4 = 9
 Result = 24 - 9 = 15
 
 Example 2:
 Input: n = 4421
 Output: 21
 Explanation:
 Product of digits = 4 * 4 * 2 * 1 = 32
 Sum of digits = 4 + 4 + 2 + 1 = 11
 Result = 32 - 11 = 21
  

 Constraints:

 1 <= n <= 10^5
 */

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var digits: [Int] = []
        var current = n
        repeat {
            digits.insert(current % 10, at: 0)
            current = current / 10
        } while current != 0

        return digits.reduce(1, *) - digits.reduce(0, +)
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
        let results = solution.subtractProductAndSum(234)
        XCTAssertEqual(results, 15)
    }

    func testExample2() {
        let results = solution.subtractProductAndSum(4421)
        XCTAssertEqual(results, 21)
    }

    func testExample3() {
        let results = solution.subtractProductAndSum(0)
        XCTAssertEqual(results, 0)
    }

    func testExample4() {
        let results = solution.subtractProductAndSum(13)
        XCTAssertEqual(results, -1)
    }
    
    func testExample5() {
        let results = solution.subtractProductAndSum(103)
        XCTAssertEqual(results, -4)
    }
    
    func testExample6() {
        let results = solution.subtractProductAndSum(7880)
        XCTAssertEqual(results, -23)
    }
}

SolutionTests.defaultTestSuite.run()
