/*
 72. Edit Distance
 Hard

 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

 You have the following 3 operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
 
 Example 1:
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 
 Example 2:
 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
*/

import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: word1.count + 1), count: word2.count + 1)
        let array1 = Array(word1)
        let array2 = Array(word2)
        
        let column = word1.count + 1
        let row = word2.count + 1
        
        for n in 1 ..< column {
            dp[0][n] = n
        }
        
        for m in 1 ..< row {
            dp[m][0] = m
        }
        
        for m in 1 ..< row {
            for n in 1 ..< column {

                if array1[n - 1] == array2[m - 1] {
                    dp[m][n] = dp[m-1][n-1]
                } else {
                    dp[m][n] = min(min(dp[m][n-1], dp[m-1][n]), dp[m-1][n-1]) + 1
                }

            }
        }
        
        print(dp)
        return dp[word2.count][word1.count]
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
    
//    func testExample1() {
//        let word1 = "horse"
//        let word2 = "ros"
//        XCTAssertEqual(solution.minDistance(word1, word2), 3)
//    }
//
//    func testExample2() {
//        let word1 = "intention"
//        let word2 = "execution"
//        XCTAssertEqual(solution.minDistance(word1, word2), 5)
//    }
    
    func testExample3() {
        let word1 = "ologco"
        let word2 = "og"
        XCTAssertEqual(solution.minDistance(word1, word2), 4)
    }
}

SolutionTests.defaultTestSuite.run()
