/*
 347. Top K Frequent Elements
 Medium

 Given a non-empty array of integers, return the k most frequent elements.

 Example 1:
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 Example 2:
 Input: nums = [1], k = 1
 Output: [1]
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 */

import Foundation

class Solution {
    struct NumberFrequence: CustomStringConvertible {
        var num: Int
        var frequence: Int = 1
        
        var description: String {
            return "num \(num), frequence \(frequence)"
        }
    }
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var numDict: [Int: Int] = [:]
        
        for num in nums {
            if numDict[num] != nil {
                numDict[num]! += 1
            } else {
                numDict[num] = 1
            }
        }
        
        var collection: [NumberFrequence] = []
        for (key, value) in numDict {
            let numFrequence = NumberFrequence(num: key, frequence: value)
            collection.append(numFrequence)
        }
        
        collection.sort {
            return $0.frequence > $1.frequence
        }
        
        var tmp = k
        var i = 0
        var result: [Int] = []
        while tmp > 0 && i < collection.count {
            result.append(collection[i].num)
            
            tmp -= 1
            i += 1
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
        let nums = [1,1,1,2,2,3]
        let results = solution.topKFrequent(nums, 2)
        XCTAssertEqual(results, [1, 2])
    }
    
    func testExample2() {
        let nums = [1]
        let results = solution.topKFrequent(nums, 1)
        XCTAssertEqual(results, [1])
    }
}

SolutionTests.defaultTestSuite.run()
