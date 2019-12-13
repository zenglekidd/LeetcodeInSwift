/*
 226. Invert Binary Tree
 Easy

 Invert a binary tree.
 Example:

 Input:
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 Output:
      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 
 Trivia:
 This problem was inspired by this original tweet by Max Howell:

 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
 */

import Foundation

/**
* Definition for a binary tree node.
*/
public class TreeNode: Equatable {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        if lhs.left == nil
            && lhs.right == nil
            && rhs.right == nil
            && rhs.right == nil {
            return lhs.val == rhs.val
        }
        return lhs.left == rhs.left
            && lhs.val == rhs.val
            && lhs.right == rhs.right
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if root?.left == nil && root?.right == nil {
            return root
        }
        
        let temp = root!.left
        root?.left = root?.right
        root?.right = temp
        
        invertTree(root?.left)
        invertTree(root?.right)
        
        return root
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
        let node1 = TreeNode(4)
        let node2 = TreeNode(2)
        let node3 = TreeNode(7)
        let node4 = TreeNode(1)
        let node5 = TreeNode(3)
        let node6 = TreeNode(6)
        let node7 = TreeNode(9)
        
        let node11 = TreeNode(4)
        let node12 = TreeNode(7)
        let node13 = TreeNode(2)
        let node14 = TreeNode(9)
        let node15 = TreeNode(6)
        let node16 = TreeNode(3)
        let node17 = TreeNode(1)
        
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        
        node11.left = node12
        node11.right = node13
        node12.left = node14
        node12.right = node15
        node13.left = node16
        node13.right = node17
        
        let results = solution.invertTree(node1)
        XCTAssert(results == node11, "Inverted")
    }
}

SolutionTests.defaultTestSuite.run()
