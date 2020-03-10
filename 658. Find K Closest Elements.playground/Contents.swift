/*
 658. Find K Closest Elements
 Medium

 Given a sorted array, two integers k and x, find the k closest elements to x in the array. The result should also be sorted in ascending order. If there is a tie, the smaller elements are always preferred.

 Example 1:
 Input: [1,2,3,4,5], k=4, x=3
 Output: [1,2,3,4]
 Example 2:
 Input: [1,2,3,4,5], k=4, x=-1
 Output: [1,2,3,4]
 Note:
 The value k is positive and will always be smaller than the length of the sorted array.
 Length of the given array is positive and will not exceed 104
 Absolute value of elements in the array and x will not exceed 104
*/

import Foundation

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        if arr.isEmpty { return [] }
        
        let index = indexOfClosest(arr, x, left: 0, right: arr.count - 1)
        
        var i = index
        var j = index
        
        for _ in 0 ..< k-1 {
            if i == 0 {
                j += 1
                continue
            }
            
            if j == arr.count - 1 {
                i -= 1
                continue
            }
            
            if x - arr[i-1] <= arr[j+1] - x {
                i -= 1
            } else {
                j += 1
            }
        }
        
        return Array(arr[i...j])
    }
    
    func indexOfClosest(_ arr: [Int], _ x: Int, left: Int, right: Int) -> Int {
        while right - left > 1 {
            let mid = left + (right - left) / 2
            
            if arr[mid] < x && x - arr[mid] > arr[mid+1] - x  {
                print("path1,\(mid+1),\(right)")
                return indexOfClosest(arr, x, left: mid + 1, right: right)
            } else {
                print("path2,\(left),\(mid)")
                return indexOfClosest(arr, x, left: left, right: mid)
            }
        }
        
        if x <= arr[left] { return left }
        if x >= arr[right] { return right }
        
        return (abs(x - arr[left]) > abs(x - arr[right])) ? right : left
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
        let input = [1,2,3,4,5]
        let k = 4
        let x = 3
        XCTAssertEqual(solution.findClosestElements(input, k, x), [1,2,3,4])
    }

    func testExample2() {
        let input = [1,2,3,4,5]
        let k = 4
        let x = -1
        XCTAssertEqual(solution.findClosestElements(input, k, x), [1,2,3,4])
    }
    
    func testExample3() {
        let input = [0,0,1,2,3,3,4,7,7,8]
        let k = 3
        let x = 5
        XCTAssertEqual(solution.findClosestElements(input, k, x), [3,3,4])
    }
}

SolutionTests.defaultTestSuite.run()
