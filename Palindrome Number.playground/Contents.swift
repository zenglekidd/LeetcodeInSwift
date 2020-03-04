/*
9. Palindrome Number
Easy

Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

Example 1:
Input: 121
Output: true
 
Example 2:
Input: -121
Output: false
 
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
Example 3:
Input: 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 
Follow up:
Coud you solve it without converting the integer to a string?
*/

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        
        var num = x
        while num >= 10 {
            let first = firstDigit(num)
            let last = num % 10
            if first != last {
                return false
            }
            
            num = num / 10
            num = removeFirstDigit(num)
        }
        return true
    }
    
    func firstDigit(_ x: Int) -> Int {
        if x < 0 { return 0 }
        var num = x
        while num >= 10 {
            num = num / 10
        }
        return num
    }
    
    func removeFirstDigit(_ x: Int) -> Int {
        if x < 0 { return 0 }
        var num = x
        var digitCount = 0
        while num >= 10 {
            num = num / 10
            digitCount += 1
        }
        
        return x - num * Int(pow(Double(10), Double(digitCount)))
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
    
//     func testExample1() {
//        XCTAssertEqual(solution.isPalindrome(121), true)
//     }
    
//    func testExample2() {
//       XCTAssertEqual(solution.isPalindrome(1341), false)
//    }
    
    func testExample3() {
        XCTAssertEqual(solution.isPalindrome(1000021), false)
    }
    
//    func testExample4() {
//        XCTAssertEqual(solution.isPalindrome(10), false)
//    }

}

SolutionTests.defaultTestSuite.run()
