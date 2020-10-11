import UIKit

/*
 Given inorder and postorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
  }
    
    func printTreeInorder(_ node: TreeNode?) {
        if node == nil { return }
        if node!.left != nil {
            printTreeInorder(node!.left)
        }

        if node!.right != nil {
            printTreeInorder(node!.right)
        }
        print(node!.val)
    }
}

class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 {return nil}
        if inorder.count == 1 {
            return TreeNode(inorder.first!)
        }

        let rootIndex = postorder.count - 1
        var index = 0
        while index < inorder.count {
            if inorder[index] == postorder[rootIndex] {
                break
            } else {
                index += 1
            }
        }
        
        let root = TreeNode(inorder[index])
        let left = buildTree(Array(inorder[0 ..< index]),Array(postorder[0 ..< index]))
        root.left = left
        
        if index != inorder.count - 1 {
            let right = buildTree(Array(inorder[index+1 ..< inorder.count]),Array(postorder[index ..< inorder.count - 1]))
            root.right = right
        }
        
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
    
    func test1() {
        let tree = solution.buildTree([4,9,5,3,15,20,7], [4,5,9,15,7,20,3])
//        XCTAssertEqual(input, result)
        print(tree?.printTreeInorder(tree))
    }
}

SolutionTests.defaultTestSuite.run()
