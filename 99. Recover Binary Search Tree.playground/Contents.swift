import UIKit

/*
 Two elements of a binary search tree (BST) are swapped by mistake.

 Recover the tree without changing its structure.

 Example 1:

 Input: [1,3,null,null,2]

    1
   /
  3
   \
    2

 Output: [3,1,null,null,2]

    3
   /
  1
   \
    2
 Example 2:

 Input: [3,1,4,null,null,2]

   3
  / \
 1   4
    /
   2

 Output: [2,1,4,null,null,3]

   2
  / \
 1   4
    /
   3
 Follow up:

 A solution using O(n) space is pretty straight forward.
 Could you devise a constant space solution?
 */

/**
 * Definition for a binary tree node.
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
}

class Solution {
    var first: TreeNode?
    var second: TreeNode?
    var prev = TreeNode(Int.min)
    
    func recoverTree(_ root: TreeNode?) {
        inOrder(root)
        
        let temp = first!.val
        first!.val = second!.val
        second!.val = temp
    }
    
    func inOrder(_ node: TreeNode?) {
        guard let node = node else {return}
        
        inOrder(node.left)
        
        if first == nil && prev.val >= node.val {
            first = prev
        }
        if first != nil && prev.val >= node.val {
            second = node
        }
        prev = node
        
        inOrder(node.right)
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
//        let results = solution.threeSum([-1, 1])
//        XCTAssertEqual(results, [])
    }
}

SolutionTests.defaultTestSuite.run()
