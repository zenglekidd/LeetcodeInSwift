import UIKit

/*
 A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

 Example 1:

 Input: S = "ababcbacadefegdehijhklij"
 Output: [9,7,8]
 Explanation:
 The partition is "ababcbaca", "defegde", "hijhklij".
 This is a partition so that each letter appears in at most one part.
 A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
  
 Note:

 S will have length in range [1, 500].
 S will consist of lowercase English letters ('a' to 'z') only.
 */

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var indexes: [Int] = []
        var counter: [Character: Int] = [:]
        for c in 0 ..< 26 {
            let key = Character(UnicodeScalar(97 + c)!)
            counter[key] = 0
        }
        
        for c in Array(S) {
            counter[c] = counter[c]! + 1
        }
        
        var current: [Character: Int] = [:]
        
        let sArray = Array(S)
        for index in 0 ..< sArray.count {
            if counter[sArray[index]] == 1 {
                // founded
                counter[sArray[index]] == 0
                if current[sArray[index]] != nil {
                    current[sArray[index]] = nil
                }
                
                if current.count == 0 {
                    indexes.append(index)
                }
            } else {
                counter[sArray[index]]! -= 1
                current[sArray[index]] = -1
            }
        }
        
        var results: [Int] = []
        for i in 0 ..< indexes.count {
            if i == 0 {
                results.append(indexes[i] + 1)
            } else {
                results.append(indexes[i] - indexes[i - 1])
            }
        }
        return results
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
        let results = solution.partitionLabels("ababcbacadefegdehijhklij")
        XCTAssertEqual(results, [9,7,8])
    }
}

SolutionTests.defaultTestSuite.run()
