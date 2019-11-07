import Cocoa
/*
 91. Decode Ways
 Medium

 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.

 Example 1:
 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 
 Example 2:
 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        var numberOfWays: [Int] = Array(repeating: 0, count: s.count)
        
        if s.count >= 1 {
            numberOfWays[0] = isDecodeble(String(s.prefix(1))) ? 1 : 0
        }
        
        if s.count >= 2 {
            var count = 0
            
            if isDecodeble(String(s.prefix(1)))
                && isDecodeble(String(s.prefix(2).suffix(1))) {
                count += 1
            }
            
            if isDecodeble(String(s.prefix(2))) {
                count += 1
            }

            numberOfWays[1] = count
            
            for i in 2 ..< s.count {
                if isDecodeble(String(s.prefix(i+1).suffix(1))) {
                    numberOfWays[i] += numberOfWays[i-1]
                }
                
                if isDecodeble(String(s.prefix(i+1).suffix(2))) {
                    numberOfWays[i] +=  numberOfWays[i-2]
                }
            }
        }
        
        print(numberOfWays)
        return numberOfWays[s.count - 1]
    }
    
    private func isDecodeble(_ s: String) -> Bool {
        if s.count > 2 || s.count == 0 {
            return false
        }
        
        if String(s.prefix(1)) == "0" {
            return false
        }
        
        guard let number = Int(s) else {
            return false
        }
        
        if number >= 1 && number <= 26 {
            return true
        }
        return false
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
        let results = solution.numDecodings("12")
        XCTAssertEqual(results, 2)
    }

    func testExample2() {
        let results = solution.numDecodings("226")
        XCTAssertEqual(results, 3)
    }

    func testExample3() {
        let results = solution.numDecodings("78")
        XCTAssertEqual(results, 1)
    }

    func testExample4() {
        let results = solution.numDecodings("2")
        XCTAssertEqual(results, 1)
    }

    func testExample5() {
        let results = solution.numDecodings("0")
        XCTAssertEqual(results, 0)
    }

    func testExample6() {
        let results = solution.numDecodings("10")
        XCTAssertEqual(results, 1)
    }

    func testExample7() {
        let results = solution.numDecodings("01")
        XCTAssertEqual(results, 0)
    }

    func testExample8() {
        let results = solution.numDecodings("012")
        XCTAssertEqual(results, 0)
    }

    func testExample9() {
        let results = solution.numDecodings("100")
        XCTAssertEqual(results, 0)
    }

    func testExample10() {
        let results = solution.numDecodings("101")
        XCTAssertEqual(results, 1)
    }

    func testExample11() {
        let results = solution.numDecodings("1001")
        XCTAssertEqual(results, 0)
    }
    
    func testExample12() {
        let results = solution.numDecodings("100001")
        XCTAssertEqual(results, 0)
    }
}

SolutionTests.defaultTestSuite.run()
