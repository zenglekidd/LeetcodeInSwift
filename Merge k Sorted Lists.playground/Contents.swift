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
        return nil
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
