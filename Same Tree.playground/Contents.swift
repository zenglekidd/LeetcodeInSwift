/*
 100. Same Tree
 Easy

 Given two binary trees, write a function to check if they are the same or not.
 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

 Example 1:
 Input:     1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 Output: true
 
 Example 2:
 Input:     1         1
           /           \
          2             2

         [1,2],     [1,null,2]

 Output: false
 
 Example 3:
 Input:     1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 Output: false
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
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        
        let node4 = TreeNode(1)
        let node5 = TreeNode(2)
        let node6 = TreeNode(3)
        
        node1.left = node2
        node1.right = node3
        
        node4.left = node5
        node4.right = node6
        
        let results = solution.isSameTree(node1, node4)
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        
        let node3 = TreeNode(1)
        let node4 = TreeNode(2)
        
        node1.left = node2
        
        node3.right = node4
        
        let results = solution.isSameTree(node1, node3)
        XCTAssertEqual(results, false)
    }
    
    func testExample3() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(1)
        
        let node4 = TreeNode(1)
        let node5 = TreeNode(1)
        let node6 = TreeNode(2)
        
        node1.left = node2
        node1.right = node3
        
        node4.left = node5
        node4.right = node6
        
        let results = solution.isSameTree(node1, node4)
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
