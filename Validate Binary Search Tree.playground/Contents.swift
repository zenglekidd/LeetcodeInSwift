/*
 98. Validate Binary Search Tree
 Medium

 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.

 Example 1:

     2
    / \
   1   3

 Input: [2,1,3]
 Output: true
 
 Example 2:
 
     5
    / \
   1   4
      / \
     3   6

 Input: [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
 */

import Foundation

/**
* Definition for a binary tree node.
 */
 public class TreeNode {
    public var val: Int {
        willSet {
            
        }
    }
    
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }

 }

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, min: Int.min, max: Int.max)

    }
    
    func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        if root == nil {
            return true
        }
        
        if root!.val <= min || root!.val >= max {
            return false
        }
        
        return isValidBST(root!.left, min: min, max: root!.val)
            && isValidBST(root!.right, min: root!.val, max: max)
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
        let node1 = TreeNode(2)
        let node2 = TreeNode(1)
        let node3 = TreeNode(3)
        node1.left = node2
        node1.right = node3
        
        let results = solution.isValidBST(node1)
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let node1 = TreeNode(5)
        let node2 = TreeNode(1)
        let node3 = TreeNode(4)
        let node4 = TreeNode(3)
        let node5 = TreeNode(6)
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        
        let results = solution.isValidBST(node1)
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
