/*
 49. Group Anagrams
 Medium

 Given an array of strings, group anagrams together.

 Example:
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 Note:

 All inputs will be in lowercase.
 The order of your output does not matter.
 */

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var resultGroups: [Int: [String]] = [:]
        for s in strs {
            let hashValue = getAnagramsHash(s)
            (resultGroups[hashValue] == nil) ? resultGroups[hashValue] = [s] : resultGroups[hashValue]?.append(s)
        }
        return Array(resultGroups.values)
    }
    
    func getAnagramsHash(_ s: String) -> Int {
        var hasher = Hasher()
        hasher.combine(s.sorted())
        return hasher.finalize()
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
        let results = solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
        XCTAssertEqual(results, [
          ["ate","eat","tea"],
          ["nat","tan"],
          ["bat"]
        ])
    }
}

SolutionTests.defaultTestSuite.run()
