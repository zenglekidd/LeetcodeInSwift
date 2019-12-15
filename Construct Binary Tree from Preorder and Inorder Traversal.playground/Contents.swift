/*
 105. Construct Binary Tree from Preorder and Inorder Traversal
 Medium

 Given preorder and inorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given
 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count != inorder.count {
            return nil
        }
        
        if preorder.count == 0 && inorder.count == 0 {
            return nil
        }
        
        if preorder.count == 1 && inorder.count == 1 {
            return TreeNode(preorder.first!)
        }
        
        let rootVal = preorder.first!
        guard let index = inorder.firstIndex(of: rootVal) else {
            return nil
        }
        
        let root = TreeNode(rootVal)
        if index == 0 {
            root.left  = nil
            root.right = buildTree(Array(preorder[1...]), Array(inorder[1...]))
            return root
        }
        
        if index == inorder.count - 1 {
            root.left  = buildTree(Array(preorder[1...]), Array(inorder[..<index]))
            root.right = nil
            return root
        }
        
        let leftPreorder = Array(preorder[1...index])
        let rightPreorder = Array(preorder[(index+1)...])
        
        let leftInorder = Array(inorder[...(index-1)])
        let rightInorder = Array(inorder[(index+1)...])
        
        root.left = buildTree(leftPreorder, leftInorder)
        root.right = buildTree(rightPreorder, rightInorder)
        
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
        let results = solution.buildTree([3,9,20,15,7], [9,3,15,20,7])
        XCTAssertEqual(results == nil, true)
    }
}

//    3
//   / \
//  9  20
//    /  \
//   15   7
//preorder = [3,9,20,15,7]
//inorder = [9,3,15,20,7]
//
//
//     3
//    / \
//   9  20
//  /  \
//15    7
//[3,9,15,7,20] preorder
//[15,9,7,3,20] inorder
//
//
//     3
//      \
//      20
//[3, null, 20]
//[3,20] preorder
//[3,20] inorder
//
//     3
//    /
//   20
// [20, 3]
// [20,3] preorder
// [3,20] inorder
//
//     1
//      \
//       2
//        \
//         3
// [1,2,3] preorder
// [1,2,3] inorder
//
//     3
//    /
//   2
//  /
// 1
// [3,2,1] preorder
// [1,2,3] inorder

SolutionTests.defaultTestSuite.run()
