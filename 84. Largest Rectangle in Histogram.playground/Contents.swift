/*
 84. Largest Rectangle in Histogram
 Hard

 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.

  
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].

 The largest rectangle is shown in the shaded area, which has area = 10 unit.

 Example:

 Input: [2,1,5,6,2,3]
 Output: 10
*/

import Foundation

class Stack {
    var array: [Int]
    
    init() {
        array = []
    }
    
    func push(_ val: Int) {
        array.append(val)
    }
    
    func pop() -> Int {
        return array.removeLast()
    }
    
    func peek() -> Int? {
        return array.last
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let s = Stack()
        
        var maxArea = 0
        for i in 0 ... heights.count {
            let bar = (i == heights.count ? 0 : heights[i])
            
            while !s.isEmpty() && heights[s.peek()!] > bar  {
                let h = s.pop()
                let w = s.isEmpty() ? i : i - s.peek()! - 1
                maxArea = max(maxArea, heights[h] * w)
            }
            s.push(i)
        }
        
        return maxArea
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
        let input = [2,1,5,6,2,3]
        XCTAssertEqual(solution.largestRectangleArea(input), 10)
    }
    
    func testExample2() {
        let input = [2,3,4,5]
        XCTAssertEqual(solution.largestRectangleArea(input), 9)
    }
}

SolutionTests.defaultTestSuite.run()
