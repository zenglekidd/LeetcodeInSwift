/*
 102. Binary Tree Level Order Traversal
 Medium

 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:
 [
   [3],
   [9,20],
   [15,7]
 ]
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        var levelRoots: [TreeNode] = []
        
        if root == nil {
            return []
        }
        
        levelRoots.append(root!)
        
        while levelRoots.isEmpty == false {
            var currentLevel: [Int] = []
            for node in levelRoots {
                if node.left != nil {
                    levelRoots.append(node.left!)
                }
                if node.right != nil {
                    levelRoots.append(node.right!)
                }
                
                let node1 = levelRoots.removeFirst()
                currentLevel.append(node1.val)
            }
            result.append(currentLevel)
        }
        
        return result
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
        
        let results = solution.levelOrder(node1)
        XCTAssertEqual(results,  [
          [3],
          [9,20],
          [15,7]
        ])
    }
}

SolutionTests.defaultTestSuite.run()
