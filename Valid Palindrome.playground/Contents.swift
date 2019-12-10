import Foundation
/*
 125. Valid Palindrome
 Easy

 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:
 Input: "A man, a plan, a canal: Panama"
 Output: true
 
 Example 2:
 Input: "race a car"
 Output: false
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        
        let validS = s.lowercased().filter { (c: Character) -> Bool in
            c.isLetter || c.isNumber
        }
        let validChars = [Character](validS)
        
        if validChars.isEmpty {
            return true
        }
        
        var left = 0
        var right = validChars.count - 1
        
        while left < right {
            if validChars[left] == validChars[right] {
                left += 1
                right -= 1
            } else {
                return false
            }
        }
        return true
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
        let results = solution.isPalindrome("A man, a plan, a canal: Panama")
        XCTAssertEqual(results, true)
    }

    func testExample2() {
        let results = solution.isPalindrome("race a car")
        XCTAssertEqual(results, false)
    }

    func testExample3() {
        let results = solution.isPalindrome("ra1223ce a 232*&^car")
        XCTAssertEqual(results, false)
    }

    func testExample4() {
        let results = solution.isPalindrome("")
        XCTAssertEqual(results, true)
    }

    func testExample5() {
        let results = solution.isPalindrome("a")
        XCTAssertEqual(results, true)
    }

    func testExample6() {
        let results = solution.isPalindrome("ab")
        XCTAssertEqual(results, false)
    }

    func testExample7() {
        let results = solution.isPalindrome("zz")
        XCTAssertEqual(results, true)
    }

    func testExample8() {
        let results = solution.isPalindrome("zaz")
        XCTAssertEqual(results, true)
    }
    
    func testExample9() {
        let results = solution.isPalindrome("z$?z")
        XCTAssertEqual(results, true)
    }
}

SolutionTests.defaultTestSuite.run()
