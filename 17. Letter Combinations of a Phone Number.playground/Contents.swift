/*
[17. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)
Medium

Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
*/

import Foundation

class Solution {
	func letterCombinations(_ digits: String) -> [String] {
        let map: [Character : String] = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]
        
        var mapToUse: [String] = []
        for d in digits {
            mapToUse.append(map[d]!)
        }
        
        var result: [String] = []
        backtracking(0, map: mapToUse, carry: "", result: &result)
        return result
    }
        

    func backtracking(_ index: Int, map: [String], carry: String, result: inout [String]) {
        if index == map.count {
            if carry != "" {
                result.append(carry)
            }
            return
        }
        
        for i in map[index] {
            backtracking(index + 1, map: map, carry: carry + String(i), result: &result)
        }
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
    
    func testLeetcodeExample1() {
        let input = "23"
        XCTAssertEqual(solution.letterCombinations(input), ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
    }

    func testLeetcodeExample2() {
        let input = ""
        XCTAssertEqual(solution.letterCombinations(input), [])
    }
}

SolutionTests.defaultTestSuite.run()
