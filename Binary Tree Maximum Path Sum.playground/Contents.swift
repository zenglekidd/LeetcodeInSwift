/*
 124. Binary Tree Maximum Path Sum
 Hard

 Given a non-empty binary tree, find the maximum path sum.

 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

 Example 1:
 Input: [1,2,3]

        1
       / \
      2   3

 Output: 6
 
 Example 2:
 Input: [-10,9,20,null,null,15,7]

    -10
    / \
   9  20
     /  \
    15   7

 Output: 42
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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        
        DFS(root, result: &result)
        
        return result
    }
    
    func DFS(_ root: TreeNode?, result: inout Int) -> Int {
        if root == nil {
            return 0
        }
        
        let left = max(0, DFS(root?.left, result: &result))
        let right = max(0, DFS(root?.right, result: &result))
        
        result = max(result, left + right + root!.val)
        
        return max(left, right) + root!.val
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
        node1.left = node2
        node1.right = node3
        
        let results = solution.maxPathSum(node1)
        XCTAssertEqual(results, 6)
    }
    
    func testExample2() {
        let node1 = TreeNode(-10)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        
        let results = solution.maxPathSum(node1)
        XCTAssertEqual(results, 42)
    }
}

SolutionTests.defaultTestSuite.run()
