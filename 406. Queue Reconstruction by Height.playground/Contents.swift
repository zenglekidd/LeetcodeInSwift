//
// Contents.swift
//
// Created by Le Zeng on 2020/7/11.
// Copyright © 2020. All rights reserved.
//
/*
406. Queue Reconstruction by Height
Medium

Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

Note:
The number of people is less than 1,100.
 
Example
Input:
[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

Output:
[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
*/

import Foundation

class Solution {
	func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sortedPeople = people.sorted { ($0[0], $1[1]) > ($1[0], $0[1]) }
        
        var result:[[Int]] = []
        for item in sortedPeople {
            result.insert(item, at: item[1])
        }
        
        return result
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
        let input = [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
        let output = [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
        XCTAssertEqual(solution.reconstructQueue(input), output)
    }
}

SolutionTests.defaultTestSuite.run()
