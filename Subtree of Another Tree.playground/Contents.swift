/*
 572. Subtree of Another Tree
 Easy

 Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
 Example 1:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
 Given tree t:
    4
   / \
  1   2
 Return true, because t has the same structure and node values with a subtree of s.
 
 Example 2:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
     /
    0
 Given tree t:
    4
   / \
  1   2
 Return false.
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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil { return false }
        if isSameTree(s, t) { return true }
        
        return isSubtree(s?.left, t) || isSubtree(s?.right, t)
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil && q != nil {
            return false
        }
        
        return p?.val == q?.val
            && isSameTree(p?.left, q?.left)
            && isSameTree(p?.right, q?.right)
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
        let node2 = TreeNode(4)
        let node3 = TreeNode(5)
        let node4 = TreeNode(1)
        let node5 = TreeNode(2)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        
        let node6 = TreeNode(4)
        let node7 = TreeNode(1)
        let node8 = TreeNode(2)
        node6.left = node7
        node6.right = node8
        
        let results = solution.isSubtree(node1, node6)
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let node1 = TreeNode(3)
        let node2 = TreeNode(4)
        let node3 = TreeNode(5)
        let node4 = TreeNode(1)
        let node5 = TreeNode(2)
        let node9 = TreeNode(0)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node5.left = node9
        
        let node6 = TreeNode(4)
        let node7 = TreeNode(1)
        let node8 = TreeNode(2)
        node6.left = node7
        node6.right = node8
        
        let results = solution.isSubtree(node1, node6)
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
