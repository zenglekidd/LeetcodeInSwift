/*
 1247. Minimum Swaps to Make Strings Equal

 You are given two strings s1 and s2 of equal length consisting of letters "x" and "y" only. Your task is to make these two strings equal to each other. You can swap any two characters that belong to different strings, which means: swap s1[i] and s2[j].

 Return the minimum number of swaps required to make s1 and s2 equal, or return -1 if it is impossible to do so.

 Example 1:
 Input: s1 = "xx", s2 = "yy"
 Output: 1
 Explanation:
 Swap s1[0] and s2[1], s1 = "yx", s2 = "yx".
 
 Example 2:
 Input: s1 = "xy", s2 = "yx"
 Output: 2
 Explanation:
 Swap s1[0] and s2[0], s1 = "yy", s2 = "xx".
 Swap s1[0] and s2[1], s1 = "xy", s2 = "xy".
 Note that you can't swap s1[0] and s1[1] to make s1 equal to "yx", cause we can only swap chars in different strings.
 
 Example 3:
 Input: s1 = "xx", s2 = "xy"
 Output: -1
 
 Example 4:
 Input: s1 = "xxyyxyxyxx", s2 = "xyyxyxxxyx"
 Output: 4
  

 Constraints:

 1 <= s1.length, s2.length <= 1000
 s1, s2 only contain 'x' or 'y'.

 */

class Solution {
    func minimumSwap(_ s1: String, _ s2: String) -> Int {
        var totalCount = 0
        var previousChar1: Character? = nil
        var xCount = 0
        var pairCount = 0
        for i in 0 ..< s1.count {
            let index = s1.index(s1.startIndex, offsetBy: i)
            let char1 = s1[index]
            let char2 = s2[index]
            
            if char1 != char2 {
                if char1 == s1[s1.index(s1.startIndex, offsetBy: 0)] {
                    xCount += 1
                }
                pairCount += 1
                
                if previousChar1 == nil {
                    previousChar1 = char1
                } else {
                    totalCount += 1
                    previousChar1 = nil
                }
            }
        }
        
        if pairCount % 2 == 1 {
            return -1
        }
        if xCount % 2 == 1 {
            totalCount += 1
        }
        
        return totalCount
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
        let results = solution.minimumSwap("xx", "yy")
        XCTAssertEqual(results, 1)
    }

    func testExample2() {
        let results = solution.minimumSwap("xy", "yx")
        XCTAssertEqual(results, 2)
    }

    func testExample3() {
        let results = solution.minimumSwap("xx", "xy")
        XCTAssertEqual(results, -1)
    }
    
    func testExample4() {
        let results = solution.minimumSwap("xxyyxyxyxx", "xyyxyxxxyx")
        XCTAssertEqual(results, 4)
    }
    
    func testExample5() {
        let results = solution.minimumSwap("yyxxyy", "xxxyyy")
        XCTAssertEqual(results, -1)
    }
}

SolutionTests.defaultTestSuite.run()
