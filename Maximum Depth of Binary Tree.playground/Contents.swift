/*
 104. Maximum Depth of Binary Tree
 Easy

 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Note: A leaf is a node with no children.

 Example:
 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
 */

import Foundation

/**
* Definition for a binary tree node.
*/
public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init(_ val: Int) {
     self.val = val
     self.left = nil
     self.right = nil
 }
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return max(maxDepth(root?.left) + 1, maxDepth(root?.right) + 1)
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
        let node1 = TreeNode(3)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        
        let results = solution.maxDepth(node1)
        XCTAssertEqual(results, 3)
    }
}

SolutionTests.defaultTestSuite.run()
