import Foundation
/*
 56. Merge Intervals
 Medium

 Given a collection of intervals, merge all overlapping intervals.

 Example 1:
 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 
 Example 2:
 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 */

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted { (i1, i2) -> Bool in
            i1[0] < i2[0]
        }
        
        var result: [[Int]] = []
        for interval in sorted {
            if result.count == 0 {
                result.append(interval)
                continue
            }
            
            if interval[0] <= result.last![1] {
                let start = (interval[0] < result.last![0]) ? interval[0] : result.last![0]
                let end = (interval[1] > result.last![1]) ? interval[1] : result.last![1]
                result[result.endIndex - 1][0] = start
                result[result.endIndex - 1][1] = end
            } else {
                result.append(interval)
            }
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
        let results = solution.merge([[1,3],[2,6],[8,10],[15,18]])
        XCTAssertEqual(results, [[1,6],[8,10],[15,18]])
    }
    
    func testExample2() {
        let results = solution.merge([[1,4],[4,5]])
        XCTAssertEqual(results, [[1,5]])
    }
    
    func testExample3() {
        let results = solution.merge([])
        XCTAssertEqual(results, [])
    }
    
    func testExample4() {
        let results = solution.merge([[1,2]])
        XCTAssertEqual(results, [[1,2]])
    }
}

SolutionTests.defaultTestSuite.run()
