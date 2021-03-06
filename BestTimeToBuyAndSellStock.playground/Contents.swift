import UIKit

/*
 121. Best Time to Buy and Sell Stock
 Easy

 Say you have an array for which the ith element is the price of a given stock on day i.

 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

 Note that you cannot sell a stock before you buy one.

 Example 1:

 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
              Not 7-1 = 6, as selling price needs to be larger than buying price.
 Example 2:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {return 0}

        var maxProfit = 0
        var minPrice: Int = Int.max

        for i in 0..<prices.count {
            minPrice = min(minPrice, prices[i])
            maxProfit = max(maxProfit, prices[i] - minPrice)
        }

        return maxProfit
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
    
    func testTwoPricePositive() {
        let results = solution.maxProfit([5,6])
        XCTAssertEqual(results, 1)
    }
//
//    func testTwoPriceNegative() {
//        let results = solution.maxProfit([10,6])
//        XCTAssertEqual(results, 0)
//    }
//
//    func testThreePricePositive() {
//        let results = solution.maxProfit([5,6,7])
//        XCTAssertEqual(results, 2)
//    }
//
//
//    func testExample1() {
//        let results = solution.maxProfit([7,1,5,3,6,4])
//        XCTAssertEqual(results, 5)
//    }
//
//    func testExample2() {
//        let results = solution.maxProfit([7,6,4,3])
//        XCTAssertEqual(results, 0)
//    }
}

SolutionTests.defaultTestSuite.run()
