import Foundation
/*
 
 1282. Group the People Given the Group Size They Belong To
 
 There are n people whose IDs go from 0 to n - 1 and each person belongs exactly to one group. Given the array groupSizes of length n telling the group size each person belongs to, return the groups there are and the people's IDs each group includes.

 You can return any solution in any order and the same applies for IDs. Also, it is guaranteed that there exists at least one solution.

 Example 1:
 Input: groupSizes = [3,3,3,3,3,1,3]
 Output: [[5],[0,1,2],[3,4,6]]
 Explanation:
 Other possible solutions are [[2,1,6],[5],[0,4,3]] and [[5],[0,6,2],[4,3,1]].
 
 Example 2:
 Input: groupSizes = [2,1,3,3,3,2]
 Output: [[1],[0,5],[2,3,4]]
 
 Constraints:
 groupSizes.length == n
 1 <= n <= 500
 1 <= groupSizes[i] <= n
 */

class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var result : [[Int]] = []
        
        var currentOpenGroups: [Int: [Int]] = [:]
        let n = groupSizes.count
        
        for people in 0 ..< n {
            var currentGroup = currentOpenGroups[groupSizes[people]]
            
            if currentGroup == nil {
                let newGroup = Array(repeating: -1, count: groupSizes[people])
                currentOpenGroups[groupSizes[people]] = newGroup
            }
            currentGroup = currentOpenGroups[groupSizes[people]]
            
            var indexToUse: Int = -2
            for (index, item) in currentGroup!.enumerated() {
                if item == -1 {
                    indexToUse = index
                    break
                }
            }

            if indexToUse == currentGroup!.count - 1 {
                // group is full, remove it to result
                currentGroup![indexToUse] = people
                result.append(currentGroup!)
                currentOpenGroups[currentGroup!.count] = nil
            } else {
                currentGroup![indexToUse] = people
                currentOpenGroups[currentGroup!.count] = currentGroup!
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
    
    func testExample1() {
        let results = solution.groupThePeople([3,3,3,3,3,1,3])
        XCTAssertEqual(results, [[5],[0,1,2],[3,4,6]])
    }
    
    func testExample2() {
        let results = solution.groupThePeople([2,1,3,3,3,2])
        XCTAssertEqual(results, [[1],[0,5],[2,3,4]])
    }
}

SolutionTests.defaultTestSuite.run()
