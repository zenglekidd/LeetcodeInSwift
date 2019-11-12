import Cocoa
/*
 206. Reverse Linked List
 Easy

 Reverse a singly linked list.

 Example:
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 
 Follow up:
 A linked list can be reversed either iteratively or recursively. Could you implement both?
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var current = head
        var previous: ListNode? = nil
        
        while (current != nil) {
            let next = current!.next
            current!.next = previous
            previous = current
            current = next
        }
        
        return previous
    }
    
    func toDisplay(_ head: ListNode?) -> [Int] {
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
        // Input [1,2,3,4,5]
        // Output [5,4,3,2,1]
        
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let result = solution.reverseList(node1)
        let array = solution.toDisplay(result)
        XCTAssertEqual(array, [5,4,3,2,1])
    }
//
//    func testExample2() {
//        let results = solution.twoSum([2, 7, 11, 15], 9)
//        XCTAssertEqual(results, [0, 1])
//    }
}

SolutionTests.defaultTestSuite.run()
