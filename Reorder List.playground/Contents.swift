import Cocoa
/*
 143. Reorder List
 Medium

 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…

 You may not modify the values in the list's nodes, only nodes itself may be changed.

 Example 1:
 Given 1->2->3->4, reorder it to 1->4->2->3.
 
 Example 2:
 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
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
    func reorderList(_ head: ListNode?) {
        // 1. find middle point
        // 2. reverse second half
        // 3. merge two
        
        if head == nil && head?.next == nil {
            return
        }
        
        let firstHalf = head
        
        var l1 = head
        var l2 = head?.next
        
        while l1?.next != nil && l2?.next != nil {
            l1 = l1?.next
            l2 = l2?.next?.next
        }
        
        let secondHalf = l1?.next
        l1?.next = nil
        var s1 = secondHalf
        
        // now l1 is at the middle point
        var previous: ListNode? = nil
        while s1?.next != nil {
            let temp = s1?.next
            s1?.next = previous
            previous = s1
            s1 = temp
        }
        s1?.next = previous
        previous = nil

        let secondHalf2 = s1
        var p1 = firstHalf
        var p2 = secondHalf2

        while p1?.next != nil && p2?.next != nil {
            let next1 = p1?.next
            let next2 = p2?.next

            p2?.next = p1?.next
            p1?.next = p2

            p1 = next1
            p2 = next2
        }
        
        if p1 == nil {
            return
        } else {
            let temp = p1?.next
            p1?.next = p2
            p1?.next?.next = temp
            return
        }
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
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6

        solution.reorderList(node1)
        XCTAssertEqual(solution.toDisplay(node1), [1,6,2,5,3,4])
    }
    
    func testExample2() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5

        solution.reorderList(node1)
        XCTAssertEqual(solution.toDisplay(node1), [1,5,2,4,3])
    }
}

SolutionTests.defaultTestSuite.run()
