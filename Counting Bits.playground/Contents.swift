/*
338. Counting Bits
Medium

Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

Example 1:
Input: 2
Output: [0,1,1]
 
Example 2:
Input: 5
Output: [0,1,1,2,1,2]
 
Follow up:
It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
Space complexity should be O(n).
Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
*/

import Foundation

class Solution {
    func countBits(_ num: Int) -> [Int] {
        if num == 0 {return [0]}
        
        var result = [0, 1]
        var i = 2
        while i <= num {
            let n1 = i >> 1
            let n2 = i % 2
            result.append(result[n1] + result[n2])
            i += 1
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
        XCTAssertEqual(solution.countBits(2), [0,1,1])
     }

    func testExample2() {
        XCTAssertEqual(solution.countBits(5), [0,1,1,2,1,2])
    }
}

SolutionTests.defaultTestSuite.run()
