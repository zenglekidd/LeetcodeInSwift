/*
 207. Course Schedule
 Medium

 There are a total of n courses you have to take, labeled from 0 to n-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

 Example 1:
 Input: 2, [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0. So it is possible.
 Example 2:
 Input: 2, [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0, and to take course 0 you should
              also have finished course 1. So it is impossible.
 Note:
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 */

import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Int: [Int]]()
        var indegree = Array(repeating: 0, count: numCourses)
        for course in prerequisites {
            indegree[course[0]] += 1
            graph[course[1], default: []].append(course[0])
        }
        var count = 0
        var queue: [Int] = []
        for (index, num) in indegree.enumerated() {
            if num == 0 {
                queue.append(index)
            }
        }
        while !queue.isEmpty {
            let num = queue.removeFirst()
            count += 1
            if let courses = graph[num] {
                for course in courses {
                    indegree[course] -= 1
                    if indegree[course] == 0 {
                        queue.append(course)
                    }
                }
            }
        }
        return count == numCourses
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
        XCTAssertEqual(solution.canFinish(2, [[1, 0]]), true)
    }

    func testExample2() {
        XCTAssertEqual(solution.canFinish(2, [[1, 0], [0, 1]]), false)
    }
}

SolutionTests.defaultTestSuite.run()
