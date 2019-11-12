import Cocoa
/*
 19. Remove Nth Node From End of List
 Medium

 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:
 Given linked list: 1->2->3->4->5, and n = 2.
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.

 Follow up:
 Could you do this in one pass?
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let reversedHead = reverseList(head, 0)
        return reverseList(reversedHead, n)
    }
    
    // reverse list and remove at n th.
    // only reverse if n == 0 or n > length
    func reverseList(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil { return nil }
        var current = head
        var previous: ListNode? = nil
        
        var count = 1
        while current?.next != nil {
            if n == count {
                // remove current node
                let temp = current?.next
                current?.next = nil
                current = temp
            } else {
                let temp = current?.next
                current?.next = previous
                previous = current
                current = temp
            }
            count += 1
        }
        
        // if removed last one
        if n == count {
            return previous
        }
        
        current?.next = previous
        previous = nil
        
        return current
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
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let results = solution.removeNthFromEnd(node1, 2)
        XCTAssertEqual(solution.toDisplay(results), [1,2,3,5])
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
        
        let results = solution.removeNthFromEnd(node1, 10)
        XCTAssertEqual(solution.toDisplay(results), [1,2,3,4,5])
    }
    
    func testExample3() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let results = solution.removeNthFromEnd(nil, 5)
        XCTAssertEqual(solution.toDisplay(results), [])
    }
    
    func testExample4() {
        let node1 = ListNode(1)
        
        let results = solution.removeNthFromEnd(node1, 1)
        XCTAssertEqual(solution.toDisplay(results), [])
    }
    
    func testExample5() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        node1.next = node2
        
        let results = solution.removeNthFromEnd(node1, 2)
        XCTAssertEqual(solution.toDisplay(results), [2])
    }
}

SolutionTests.defaultTestSuite.run()
