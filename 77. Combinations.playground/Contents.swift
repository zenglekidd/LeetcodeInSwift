//
//  Created by Le Zeng on 2020/7/10.
//
// 
/*
77. Combinations
Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

Example:

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
*/

import Foundation

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result:[[Int]] = []
        var pool: [Int] = []
        for i in 1 ... n {
            pool.append(i)
        }
        backtracking(k:k, pool: pool, subset: [], result: &result)
        return result
    }
    
    func backtracking(k:Int , pool: [Int], subset:[Int], result: inout [[Int]]) {        
        if k == 0 {
            result.append(subset)
            return
        }
        
        for i in 0 ..< pool.count {
            let newPool = Array(pool[i+1..<pool.count])
            var mutableSubset = subset
            mutableSubset.append(pool[i])
            
            backtracking(k: k-1, pool: newPool, subset: mutableSubset, result: &result)
        }
    }
}

import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testLeetcodeExample1() {
        XCTAssertEqual(solution.combine(4, 2),
                       [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]])
    }

    func testLeetcodeExample2() {
        XCTAssertEqual(solution.combine(4, 0),[[]])
    }

    func testLeetcodeExample3() {
        XCTAssertEqual(solution.combine(4, 4),[[1,2,3,4]])
    }

    func testLeetcodeExample4() {
        XCTAssertEqual(solution.combine(4, 5),[])
    }
}

SolutionTests.defaultTestSuite.run()
