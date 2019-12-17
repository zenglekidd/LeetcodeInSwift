/*
 230. Kth Smallest Element in a BST
 Medium

 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 
 Example 1:
 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 Output: 1
 
 Example 2:
 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 Output: 3
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return 0
        }
        
        let left = countElements(root?.left)
        if k == left + 1 {
            return root!.val
        } else if k > left + 1 {
            return kthSmallest(root?.right, k - left - 1)
        } else {
            return kthSmallest(root?.left, k)
        }
    }
    
    func countElements(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if root?.left == nil && root?.right == nil {
            return 1
        }
        
        return 1 + countElements(root?.left) + countElements(root?.right)
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
    
//    func testExample1() {
//        let node1 = TreeNode(3)
//        let node2 = TreeNode(1)
//        let node3 = TreeNode(4)
//        let node4 = TreeNode(2)
//        node1.left = node2
//        node1.right = node3
//        node2.right = node4
//
//        let results = solution.kthSmallest(node1, 1)
//        XCTAssertEqual(results, 1)
//    }
    
    func testExample2() {
        let node1 = TreeNode(5)
        let node2 = TreeNode(3)
        let node3 = TreeNode(6)
        let node4 = TreeNode(2)
        let node5 = TreeNode(4)
        let node6 = TreeNode(1)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node4.left = node6

        let results = solution.kthSmallest(node1, 3)
        XCTAssertEqual(results, 3)
    }
}

SolutionTests.defaultTestSuite.run()
