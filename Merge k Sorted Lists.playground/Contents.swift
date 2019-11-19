import Cocoa
/*
 23. Merge k Sorted Lists
 Hard

 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

 Example:
 Input:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 Output: 1->1->2->3->4->4->5->6
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return partion(lists, start: 0, end: lists.count - 1)
    }
    
    func partion(_ lists: [ListNode?], start: Int, end: Int) -> ListNode? {
        if start == end { return lists[start] }
        if start < end {
            let middle = (start + end) / 2
            let l1 = partion(lists, start: start, end: middle)
            let l2 = partion(lists, start: middle+1, end: end)
            return mergeTwoLists(l1, l2)
        }
        return nil
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        // create a new node
        // walk through two lists by comparsion
        let beforeHead = ListNode(0)
        var newHead: ListNode? = beforeHead
        var current1 = l1
        var current2 = l2
        
        while current1 != nil && current2 != nil {
            let next1 = current1?.next
            let next2 = current2?.next
            
            if current1!.val < current2!.val {
                newHead?.next = current1
                current1 = next1
            } else {
                newHead?.next = current2
                current2 = next2
            }
            
            newHead = newHead?.next
        }
        
        if current1 == nil{
            newHead?.next = current2
        }
        
        if current2 == nil {
            newHead?.next = current1
        }
                
        return beforeHead.next
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
        let node2 = ListNode(4)
        let node3 = ListNode(5)
        node1.next = node2
        node2.next = node3
        
        let node4 = ListNode(1)
        let node5 = ListNode(3)
        let node6 = ListNode(4)
        node4.next = node5
        node5.next = node6
        
        let node7 = ListNode(2)
        let node8 = ListNode(6)
        node7.next = node8
        
        let results = solution.mergeKLists([node1, node4, node7])
        XCTAssertEqual(solution.toDisplay(results), [1,1,2,3,4,4,5,6])
    }
}

SolutionTests.defaultTestSuite.run()
