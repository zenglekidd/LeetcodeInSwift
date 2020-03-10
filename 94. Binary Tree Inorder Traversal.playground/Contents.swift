/*
https://leetcode.com/problems/binary-tree-inorder-traversal/
94. Binary Tree Inorder Traversal
Medium

Given a binary tree, return the inorder traversal of its nodes' values.

Example:
Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,3,2]
Follow up: Recursive solution is trivial, could you do it iteratively?
*/

import Foundation

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
	func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        let left = inorderTraversal(root?.left)
        let right = inorderTraversal(root?.right)
        
        var array: [Int] = []
        array.append(contentsOf: left)
        array.append(root!.val)
        array.append(contentsOf: right)
        
        return array
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
    
    func testLeetcodeExample1() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.right = node2
        node2.left = node3
        
        XCTAssertEqual(solution.inorderTraversal(node1), [1,3,2])
    }

}

SolutionTests.defaultTestSuite.run()
