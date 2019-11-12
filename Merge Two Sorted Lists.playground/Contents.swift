import Cocoa
/*
 21. Merge Two Sorted Lists
 Easy

 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

 Example:
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        let head = l1
        
        var current1 = l1
        var current2 = l2
        var current = current1
        
        while current1 != nil && current2 != nil {
            let next1 = current1?.next
            let next2 = current2?.next
            
            if next1?.val > current2?.val {
                current1?.next = next1
                current = next1
            } else {
                current1?.next = current2
            }
            
            if next1 == nil {
                current2?.next = next2
                break;
            } else {
                current2?.next = next1
            }
                        
            
            
            current1 = next1
            current2 = next2
        }
                
        return head
    }
    
    func toDisplay(_ head: ListNode?) -> [Int] {
        if head == nil { return [] }
        
        var result: [Int] = []
        var current = head
        while ((current?.next) != nil) {
            result.append(current!.val)
            current = current?.next
        }
        result.append(current!.val)
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
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(4)
        node1.next = node2
        node2.next = node3

        let node4 = ListNode(1)
        let node5 = ListNode(3)
        let node6 = ListNode(4)
        node4.next = node5
        node5.next = node6


        let results = solution.mergeTwoLists(node1, node4)
        XCTAssertEqual(solution.toDisplay(results), [1,1,2,3,4,4])
    }

    func testExample2() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        node1.next = node2
        node2.next = node3

        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node4.next = node5
        node5.next = node6
    
        let results = solution.mergeTwoLists(node1, node4)
        XCTAssertEqual(solution.toDisplay(results), [1,2,3,4,5,6])
    }

    func testExample3() {
        let node1 = ListNode(1)

        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node4.next = node5
        node5.next = node6

        let results = solution.mergeTwoLists(node1, node4)
        XCTAssertEqual(solution.toDisplay(results), [1,4,5,6])
    }

    func testExample4() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        node1.next = node2
        node2.next = node3

        let node4 = ListNode(4)

        let results = solution.mergeTwoLists(node1, node4)
        XCTAssertEqual(solution.toDisplay(results), [1,2,3,4])
    }

    func testExample5() {
        let node1:ListNode? = nil
        let node4 = ListNode(1)

        let results = solution.mergeTwoLists(node1, node4)
        XCTAssertEqual(solution.toDisplay(results), [1])
    }
//
//    func testExample6() {
//        let node1 = ListNode(2)
//        let node4:ListNode? = nil
//
//        let results = solution.mergeTwoLists(node1, node4)
//        XCTAssertEqual(solution.toDisplay(results), [2])
//    }
}

SolutionTests.defaultTestSuite.run()
