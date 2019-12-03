import Foundation
/*
 131. Palindrome Partitioning
 Medium

 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return all possible palindrome partitioning of s.

 Example:

 Input: "aab"
 Output:
 [
   ["aa","b"],
   ["a","a","b"]
 ]
 */

class Solution {
    func partition(_ s: String) -> [[String]] {

        var result: [[String]] = []

        func dfs(chars: ArraySlice<Character>, partiton: [String]) {

            if chars.isEmpty {
                result.append(partiton)
                return
            }

            for length in 1...chars.count {
                let part = chars.prefix(length)
                if isPalindrome(chars) {
                    let leftPart = chars.dropFirst(length)
                    dfs(chars: leftPart, partiton: partiton + [String(part)])
                }
            }
        }

        func isPalindrome(_ s: ArraySlice<Character>) -> Bool {
            return !zip(s, s.reversed()).contains { $0 != $1 }
        }

        dfs(chars: ArraySlice(s), partiton: [])
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
        self.measure {
            let string = String(repeating: "Hello world", count: 5)
            let results = solution.partition(string)
//            XCTAssertEqual(results, [[]])
        }
    }
}

SolutionTests.defaultTestSuite.run()
