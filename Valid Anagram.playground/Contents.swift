import Foundation
/*
 242. Valid Anagram
 Easy

 Given two strings s and t , write a function to determine if t is an anagram of s.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false
 
 Note:
 You may assume the string contains only lowercase alphabets.

 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 */

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var repeatCounts = Array(repeating: 0, count: 26)
        for char in s {
            addingChar(char, toCountArray: &repeatCounts)
        }
        
        for char in t {
            removingChar(char, toCountArray: &repeatCounts)
        }
        
        for count in repeatCounts {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
    
    func charAtIndex(_ s: String, _ index: Int) -> Character {
        let currentCharIndex = s.index(s.startIndex, offsetBy: index)
        let currentChar = s[currentCharIndex]
        
        return currentChar
    }
    
    func addingChar(_ c: Character, toCountArray repeatCounts: inout [Int]) {
        let a = Character("a")
        let asciiValueOfA = a.asciiValue!
        let offset = c.asciiValue! - asciiValueOfA
        
        repeatCounts[Int(offset)] += 1
    }
    
    func removingChar(_ c: Character, toCountArray repeatCounts: inout [Int]) {
        let a = Character("a")
        let asciiValueOfA = a.asciiValue!
        let offset = c.asciiValue! - asciiValueOfA
        
        repeatCounts[Int(offset)] -= 1
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
        let results = solution.isAnagram("anagram", "nagaram")
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let results = solution.isAnagram("rat", "car")
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
