/*
739. Daily Temperatures
Medium

Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
*/

import Foundation

class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: T.count)
        var stack: [Int] = []
        
        for index in 0 ..< T.count {
            while stack.isEmpty == false && T[index] > T[stack.last!] {
                let last = stack.removeLast()
                result[last] = index - last
            }
            stack.append(index)
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
        let input = [73,74,75,71,69,72,76,73]
        XCTAssertEqual(solution.dailyTemperatures(input), [1, 1, 4, 2, 1, 1, 0, 0])
    }
}

SolutionTests.defaultTestSuite.run()
