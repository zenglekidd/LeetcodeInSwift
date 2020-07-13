//
// Contents.swift
//
// Created by Le Zeng on 2020/7/10.
// Copyright © 2020. All rights reserved.
//
/*
337. House Robber III

The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

Determine the maximum amount of money the thief can rob tonight without alerting the police.

Example 1:

Input: [3,2,3,null,3,null,1]

     3
    / \
   2   3
    \   \
     3   1

Output: 7
Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
Example 2:

Input: [3,4,5,1,3,null,1]

     3
    / \
   4   5
  / \   \
 1   3   1

Output: 9
Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
*/

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
     self.val = val
     self.left = left
     self.right = right
    }
}

extension TreeNode:Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(left)
        hasher.combine(right)
    }
}

//class Solution {
//    func rob(_ root: TreeNode?) -> Int {
//        var dp:[TreeNode: Int] = [:]
//        return robDP(root, &dp)
//    }
//
//    func robDP(_ root: TreeNode?, _ dp: inout [TreeNode: Int]) -> Int {
//        if root == nil {return 0}
//        if dp[root!] != nil {return dp[root!]!}
//
//        var result = 0
//
//        if root!.left != nil {
//            result += robDP(root!.left!.left, &dp) + robDP(root!.left!.right, &dp)
//        }
//
//        if root!.right != nil {
//            result += robDP(root!.right!.left,&dp) + robDP(root!.right!.right, &dp)
//        }
//
//        result = max(result + root!.val, robDP(root!.left, &dp) + robDP(root!.right, &dp))
//        dp[root!] = result
//
//        return result
//    }
//}

class Solution {
    func rob(_ root: TreeNode?) -> Int {
        let result = robSub(root)
        // result[0] shows root not robbed, result[1] shows root is robbed
        return max(result[0], result[1])
    }
    
    func robSub(_ root: TreeNode?) -> [Int] {
        if root == nil {return [0, 0]}

        let left = robSub(root!.left)
        let right = robSub(root!.right)
        
        var result: [Int] = []
        result.append(max(left[0], left[1]) + max(right[0], right[1]))
        result.append(root!.val + left[0] + right[0])

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
        //[3,2,3,null,3,null,1]
        let node1 = TreeNode(3)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(3)
        let node5 = TreeNode(1)
        node1.left = node2
        node1.right = node3
        node2.right = node4
        node3.right = node5
        
        XCTAssertEqual(solution.rob(node1), 7)
    }
    
    func testLeetcodeExample2() {
        // [3,4,5,1,3,null,1]
        let node1 = TreeNode(3)
        let node2 = TreeNode(4)
        let node3 = TreeNode(5)
        let node4 = TreeNode(1)
        let node5 = TreeNode(3)
        let node6 = TreeNode(1)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.right = node6

        XCTAssertEqual(solution.rob(node1), 9)
    }
    
    func testLeetcodeExample3() {
        // [2,1,3,null,4]
        let node1 = TreeNode(2)
        let node2 = TreeNode(1)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        node1.left = node2
        node1.right = node3
        node2.right = node4

        XCTAssertEqual(solution.rob(node1), 7)
    }
    
    func testLeetcodeExample4() {
        // [4,1,null,2,null,3]
        let node1 = TreeNode(4)
        let node2 = TreeNode(1)
        let node3 = TreeNode(2)
        let node4 = TreeNode(3)
        node1.left = node2
        node2.left = node3
        node3.left = node4

        XCTAssertEqual(solution.rob(node1), 7)
    }
}

SolutionTests.defaultTestSuite.run()
