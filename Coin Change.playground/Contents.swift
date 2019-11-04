/*
 322. Coin Change
 Medium

 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 Example 1:

 Input: coins = [1, 2, 5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:

 Input: coins = [2], amount = 3
 Output: -1
 */

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        // Fewest number of coins in (amount - coins[1]), (amount - coins[2]) ... (amount - coins[n - 1])
        let sortedCoins = coins.sorted()
        
        if amount < 0 {
            return -1
        } else if amount == 0 {
            return 0
        } else if amount < sortedCoins[0] {
            return -1
        }
        
        var numberOfCoins = Array(repeating: Int.max, count: amount + 1)
        let coinTypeCount = sortedCoins.count
        
        for j in 0 ..< coinTypeCount {
            if sortedCoins[j] <= amount {
                numberOfCoins[sortedCoins[j]] = 1
            }
            
        }
        
        for i in 1 ... amount {
            for j in 0 ..< coinTypeCount {
                if i > sortedCoins[j] {
                    numberOfCoins[i] = min(numberOfCoins[i], numberOfCoins[i - sortedCoins[j]])
                }
                
                if i == sortedCoins[j] {
                    numberOfCoins[sortedCoins[j]] = 0
                }
            }
            
            if numberOfCoins[i] != Int.max {
                numberOfCoins[i] += 1
            }
        }
        
        if numberOfCoins[amount]  == Int.max {
            return -1
        }
        
        return numberOfCoins[amount]
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
        let results = solution.coinChange([1, 2, 5], 8)
        XCTAssertEqual(results, 3)
    }

    func testExample2() {
        let results = solution.coinChange([2], 3)
        XCTAssertEqual(results, -1)
    }

    func testExample3() {
        let results = solution.coinChange([1, 2, 5], 22)
        XCTAssertEqual(results, 5)
    }

    func testExample4() {
        let results = solution.coinChange([1], 0)
        XCTAssertEqual(results, 0)
    }

    func testExample5() {
        let results = solution.coinChange([1], -5)
        XCTAssertEqual(results, -1)
    }

    func testExample6() {
        let results = solution.coinChange([2], 1)
        XCTAssertEqual(results, -1)
    }

    func testExample7() {
        let results = solution.coinChange([1,2147483647], 2)
        XCTAssertEqual(results, 2)
    }
    
    func testExample8() {
        let results = solution.coinChange([474,83,404,3], 264)
        XCTAssertEqual(results, 8)
    }
}

SolutionTests.defaultTestSuite.run()
