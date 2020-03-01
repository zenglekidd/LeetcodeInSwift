/*
 295. Find Median from Data Stream
 Hard

 Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

 For example,
 [2,3,4], the median is 3
 [2,3], the median is (2 + 3) / 2 = 2.5

 Design a data structure that supports the following two operations:

 void addNum(int num) - Add a integer number from the data stream to the data structure.
 double findMedian() - Return the median of all elements so far.
  

 Example:
 addNum(1)
 addNum(2)
 findMedian() -> 1.5
 addNum(3)
 findMedian() -> 2

 Follow up:

 If all integer numbers from the stream are between 0 and 100, how would you optimize it?
 If 99% of all integer numbers from the stream are between 0 and 100, how would you optimize it?
 */

import Foundation

class MedianFinder {
    var numbers:[Int] = []

    /** initialize your data structure here. */
    init() {
        
    }
    
    func addNum(_ num: Int) {
        var left = 0
        var right = numbers.count - 1
        while left <= right {
            let middle = (left + right) / 2
            if num <= numbers[middle] {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        numbers.insert(num, at: left)
    }
    
    func findMedian() -> Double {
        if numbers.count % 2 == 0 {
            return Double(numbers[numbers.count/2 - 1] + numbers[numbers.count/2]) / Double(2)
        } else {
            return Double(numbers[(numbers.count - 1)/2])
        }
    }
}

import Foundation
import XCTest
class SolutionTests: XCTestCase {
    var finder: MedianFinder!
    override func setUp() {
        super.setUp()
        finder = MedianFinder()
    }
    
    func testExample1() {
        finder.addNum(1)
        finder.addNum(2)
        XCTAssertEqual(finder.findMedian(), 1.5)
        finder.addNum(3)
        XCTAssertEqual(finder.findMedian(), 2)
    }
    
    func testExample2() {
        finder.addNum(-1)
        finder.addNum(-2)
        XCTAssertEqual(finder.findMedian(), -1.5)
        finder.addNum(-3)
        XCTAssertEqual(finder.findMedian(), -2)
        finder.addNum(-4)
        XCTAssertEqual(finder.findMedian(), -2.5)
        finder.addNum(-5)
        XCTAssertEqual(finder.findMedian(), -3)
    }
}

SolutionTests.defaultTestSuite.run()
