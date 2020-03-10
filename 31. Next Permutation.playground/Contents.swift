/*
https://leetcode.com/problems/next-permutation/
31. Next Permutation
Medium

Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place and use only constant extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1
*/

import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.isEmpty {return}
        
        // From right to left, find the first decrease number
        var firstDecreaseNumberIndex = -1
        var previous = nums.last!
        
        for i in (0 ..< nums.count-1).reversed() {
            if nums[i] < previous {
                firstDecreaseNumberIndex = i
                break
            }
            previous = nums[i]
        }
        
        // If nothing find reverse the array
        if firstDecreaseNumberIndex == -1 {
            nums.reverse()
            return
        }
        
        // Starting from this decreased number, go back to find the lowest increase that's larger than firstDecreaseNumber
        // Swap those two
        var indexToSwap = -1
        var lowest = Int.max
        for i in ((firstDecreaseNumberIndex + 1) ..< nums.count) {
            if nums[i] < lowest && nums[i] > nums[firstDecreaseNumberIndex] {
                lowest = nums[i]
                indexToSwap = i
            }
        }
        
        swapNums(&nums, firstDecreaseNumberIndex, indexToSwap)
        
        print(nums)
        
        // Starting from this decreased number, sort in-place
        for i in ((firstDecreaseNumberIndex + 1) ..< nums.count) {
            let next = i + 1
            for j in next ..< nums.count {
                if nums[i] > nums[j] {
                    swapNums(&nums, i, j)
                }
            }
        }
    }
    
    func swapNums(_ nums: inout [Int], _ x: Int, _ y: Int) {
        if x < 0 || x >= nums.count || y < 0 || y >= nums.count {
            return
        }
        
        let temp = nums[x]
        nums[x] = nums[y]
        nums[y] = temp
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
        var input = [1,2,3]
        solution.nextPermutation(&input)
        XCTAssertEqual(input, [1,3,2])
    }

    func testLeetcodeExample2() {
        var input = [3,2,1]
        solution.nextPermutation(&input)
        XCTAssertEqual(input, [1,2,3])
    }

    func testLeetcodeExample3() {
        var input = [1,1,5]
        solution.nextPermutation(&input)
        XCTAssertEqual(input, [1,5,1])
    }

    func testLeetcodeExample4() {
        var input = [1,3,7,2,4,9,8]
        solution.nextPermutation(&input)
        XCTAssertEqual(input, [1,3,7,2,8,4,9])
    }
    
    func testLeetcodeExample5() {
        var input = [2,3,1]
        solution.nextPermutation(&input)
        XCTAssertEqual(input, [3,1,2])
    }
    
    func testLeetcodeExample6() {
        var input = [1,5,1]
        solution.nextPermutation(&input)
        XCTAssertEqual(input, [5,1,1])
    }
    
    
}

SolutionTests.defaultTestSuite.run()
