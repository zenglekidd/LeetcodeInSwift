import Cocoa
/*
 141. Linked List Cycle
 Easy

 Given a linked list, determine if it has a cycle in it.

 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

  

 Example 1:
 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the second node.

 Example 2:
 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the first node.

 Example 3:
 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.

 Follow up:

 Can you solve it using O(1) (i.e. constant) memory?
 */

/**
* Definition for singly-linked list.
*/
public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int) {
       self.val = val
       self.next = nil
   }
}

class Solution {
    func hasCycle(_ head: ListNode?, pos : Int) -> Bool {
        return true
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
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(0)
        let node4 = ListNode(-4)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        let results = solution.hasCycle(node1, pos: 1)
        XCTAssertEqual(results, true)
    }
    
    func testExample2() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        node1.next = node2
        
        let results = solution.hasCycle(node1, pos: 0)
        XCTAssertEqual(results, true)
    }
    
    func testExample3() {
        let node1 = ListNode(1)
        let results = solution.hasCycle(node1, pos: -1)
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
