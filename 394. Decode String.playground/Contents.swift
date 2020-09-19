import UIKit

/*
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:

 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:

 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
 Example 4:

 Input: s = "abc3[cd]xyz"
 Output: "abccdcdcdxyz"
 */

struct Stack<T> {
    var array: [T] = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        if array.count == 0 { return nil }
        return array.removeLast()
    }
}

class Solution {
    func decodeString(_ s: String) -> String {
        
        var stack = Stack<(String, Int)>()
        var result = ""
        var num = 0
        
        for c in s {
            switch c {
            case "[":
                stack.push((result, num))
                result = ""
                num = 0
            case "]":
                let (prev, num) = stack.pop() ?? ("", 0)
                result = prev + String(repeating: result, count: num)
            case _ where c.isNumber:
                num = num * 10 + Int(String(c))!
            default:
                result += String(c)
            }
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
    
    func test1() {
        let input = "3[a]2[bc]"
        let output = "aaabcbc"
        let results = solution.decodeString(input)
        XCTAssertEqual(results, output)
    }

    func test2() {
        let input = "3[a2[c]]"
        let output = "accaccacc"
        let results = solution.decodeString(input)
        XCTAssertEqual(results, output)
    }

    func test3() {
        let input = "2[abc]3[cd]ef"
        let output = "abcabccdcdcdef"
        let results = solution.decodeString(input)
        XCTAssertEqual(results, output)
    }
    
    func test4() {
        let input = "abc3[cd]xyz"
        let output = "abccdcdcdxyz"
        let results = solution.decodeString(input)
        XCTAssertEqual(results, output)
    }
}

SolutionTests.defaultTestSuite.run()
