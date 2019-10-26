//
//  Solution.swift
//  Solutionground
//
//  Created by Le Zeng on 2019/10/26.
//  Copyright © 2019 Le Zeng. All rights reserved.
//

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        
        var results: Set<[Int]> = []
        
        var zeroCount = 0
        let numSorted = nums.sorted()
        for (index1, num1) in numSorted.enumerated() {

            if num1 == 0 {
                zeroCount += 1
            }
            if zeroCount > 3 {
                continue
            }
            
            let subArray = Array(numSorted.dropFirst(index1+1))
            let twoSumResults = twoSum(subArray, -num1)
            if twoSumResults != [] {
                for twoSumResult in twoSumResults {
                    var array = [num1]
                    array.append(contentsOf: twoSumResult)
                    let sortedArray = array.sorted()
                    results.insert(sortedArray)
                }
            }
        }
        
        let unsorted = Array(results)
        return sortArrayOfArray(unsorted)
    }
    
    fileprivate func sortArrayOfArray(_ unsorted: [[Int]]) -> [[Int]] {
        let sorted = unsorted.sorted {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else if $0[1] != $1[1] {
                return $0[1] < $1[1]
            } else {
                return $0[2] < $1[2]
            }
        }
        return sorted
    }

    fileprivate func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var dict: [Int: Int] = [:]
        var results : [[Int]] = []

        for (index, num) in nums.enumerated() {
            if dict[num] != nil {
                results.append([nums[dict[num]!], num])
            }
            
            dict[target - num] = index
        }
        
        return results
    }
}
