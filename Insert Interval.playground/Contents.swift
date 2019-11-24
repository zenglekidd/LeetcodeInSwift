import Foundation
/*
 57. Insert Interval
 Hard

 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

 You may assume that the intervals were initially sorted according to their start times.

 Example 1:
 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 
 Example 2:
 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
 */

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        // Check if non-overlapping, if so, added to result
        
        // Check if contained, if so,
        // compare new interval is equal to last element, if not
        // added new interval to result,
        
        // Check if overlapping, if so, extend it.
        // before insert to result, check it it merges with previous last element
        
        if intervals.count == 0 { return [newInterval] }
        
        var result: [[Int]] = []
        var isAlwaysNoOverlapping = true
        for interval in intervals {
            if isNonOverlapping(interval, newInterval) {
                result.append(interval)
            } else if isContained(interval, newInterval) {
                isAlwaysNoOverlapping = false
                let lastElement = result.last
                if lastElement != nil &&
                    (lastElement![0] != newInterval[0] &&
                    lastElement![1] != newInterval[1]) {
                    result.append(newInterval)
                } else {
                    if lastElement == nil {
                        result.append(newInterval)
                    }
                }
            } else {
                isAlwaysNoOverlapping = false
                // overlapping
                if result.count == 0 {
                    result.append(newInterval)
                }
                
                let lastElement = result.last
                let merged = mergeTwo(interval, newInterval)
                if isOverlapping(lastElement!, merged) {
                    result.removeLast()
                    result.append(mergeTwo(lastElement!, merged))
                } else {
                    result.append(merged)
                }
            }
        }
        
        if isAlwaysNoOverlapping {
            
            if intervals.first![0] > newInterval[1] {
                result.insert(newInterval, at: 0)
                return result
            }
            
            if intervals.last![1] < newInterval[0] {
                result.append(newInterval)
                return result
            }
            
            var indexToInsert = -1
            var previous = [Int.min, Int.min]
            for (index,interval) in intervals.enumerated() {
                if previous[0] < newInterval[0] && newInterval[0] < interval[0] {
                    indexToInsert = index
                }
                
                previous = interval
            }
            result.insert(newInterval, at: indexToInsert)
        }

        return result
    }
    
    func isNonOverlapping(_ interval1: [Int], _ interval2: [Int]) -> Bool {
        return (interval1[1] < interval2[0] || interval1[0] > interval2[1])
    }
    
    func isContained(_ interval1: [Int], _ interval2: [Int]) -> Bool {
        return (interval1[0] > interval2[0]) && (interval1[1] < interval2[1])
    }
    
    func isOverlapping(_ interval1: [Int], _ interval2: [Int]) -> Bool {
        return interval1[1] > interval2[0]
    }
    
    func mergeTwo(_ interval1: [Int], _ interval2: [Int]) -> [Int] {
        var i: [Int] = []
        i.append(min(interval1[0], interval2[0]))
        i.append(max(interval1[1], interval2[1]))
        return i
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
        let results = solution.insert([[1,3],[6,9]], [2,5])
        XCTAssertEqual(results, [[1,5],[6,9]])
    }

    func testExample2() {
        let results = solution.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
        XCTAssertEqual(results, [[1,2],[3,10],[12,16]])
    }

    func testExample3() {
        let results = solution.insert([[1,5]], [6,8])
        XCTAssertEqual(results, [[1,5],[6,8]])
    }

    func testExample4() {
        let results = solution.insert([[1,5]], [0,0])
        XCTAssertEqual(results, [[0,0],[1,5]])
    }
    
    func testExample5() {
        let results = solution.insert([[1,5]], [0,6])
        XCTAssertEqual(results, [[0,6]])
    }
}

SolutionTests.defaultTestSuite.run()
