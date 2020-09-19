import UIKit

/*
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        return []
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
    
    func test1() {
        let results = solution.threeSum([-1, 1])
        XCTAssertEqual(results, [])
    }
}

SolutionTests.defaultTestSuite.run()
