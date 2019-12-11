import Foundation
/*
 76. Minimum Window Substring
 Hard

 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

 Example:

 Input: S = "ADOBECODEBANC", T = "ABC"
 Output: "BANC"
 Note:
 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 */

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sChars: [Character] = Array(s)
        var shortest = (0, Int.max)
        var repeatCounts: [Character: Int] = [:]
        var counter = t.count
        
        for c in t {
            repeatCounts[c] = (repeatCounts[c] ?? 0) + 1
        }
        
        var left = 0
        
        for (right, c) in s.enumerated() {
            if repeatCounts[c] != nil {
                repeatCounts[c]! -= 1
                if repeatCounts[c]! >= 0 {
                    counter -= 1
                }
            }
            
//            print(repeatCounts, counter, left, right)
            if counter == 0 {
                while repeatCounts[sChars[left]] == nil || repeatCounts[sChars[left]]! < 0 {
                    if repeatCounts[sChars[left]] == nil {
                        left += 1
                        continue
                    }
                    
//                    print("left++", repeatCounts, counter, left, right)
                    if repeatCounts[sChars[left]]! < 0 {
                        repeatCounts[sChars[left]]! += 1
                        left += 1
                    }
                }
                
//                print("hahahhahh", repeatCounts, counter, left, right)
    
                // founded
                if shortest.1 == Int.max {
                    shortest.0 = left
                    shortest.1 = right
                } else {
                    let size = right - left + 1
                    if size < (shortest.1 - shortest.0 + 1) {
                        shortest.0 = left
                        shortest.1 = right
                    }
                }
                
                repeatCounts[sChars[left]]! += 1
                counter += 1
                left += 1
                
//                print("xuxuxu", repeatCounts, counter, left, right)
            }
        }
        return (shortest.1 == Int.max) ? "" : String(sChars[shortest.0 ... shortest.1])
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
        let results = solution.minWindow("ADOBECODEBANC", "ABC")
        XCTAssertEqual(results, "BANC")
    }

    func testExample2() {
        let results = solution.minWindow("a", "a")
        XCTAssertEqual(results, "a")
    }

    func testExample3() {
        let results = solution.minWindow("ab", "b")
        XCTAssertEqual(results, "b")
    }

    func testExample4() {
        let results = solution.minWindow("bba", "ab")
        XCTAssertEqual(results, "ba")
    }
}

SolutionTests.defaultTestSuite.run()
