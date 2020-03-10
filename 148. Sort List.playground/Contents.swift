/*
https://leetcode.com/problems/sort-list/
148. Sort List
Medium

Sort a linked list in O(n log n) time using constant space complexity.

Example 1:
Input: 4->2->1->3
Output: 1->2->3->4
 
Example 2:
Input: -1->5->3->4->0
Output: -1->0->3->4->5
*/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
	func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {return head}
        
        var fast = head
        var slow = head
        var pre: ListNode?
        
        while fast?.next != nil && slow?.next != nil {
            pre = slow
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        pre?.next = nil
        let l1 = sortList(head)
        let l2 = sortList(slow)
        
        return mergeTwoLists(l1, l2)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if(l1 == nil) {return l2}
        if(l2 == nil) {return l1}
        var result:ListNode? = nil
        
        if(l1!.val <= l2!.val) {
            result = l1
            result!.next = mergeTwoLists(l1!.next,l2)
        }
        else {
            result = l2
            result!.next = mergeTwoLists(l1,l2!.next)
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
    
    func testLeetcodeExample1() {
        let node1 = ListNode(4)
        let node2 = ListNode(2)
        let node3 = ListNode(1)
        let node4 = ListNode(3)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        solution.sortList(node1)
        
//        XCTAssertEqual(solution.sortList(node1), 0)
    }

}

SolutionTests.defaultTestSuite.run()
