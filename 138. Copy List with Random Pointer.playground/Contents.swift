//
// Contents.swift
//
// Created by Le Zeng on 2020/7/11.
// Copyright © 2020. All rights reserved.
//
/*
138. Copy List with Random Pointer
Medium
 
A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

Return a deep copy of the list.

The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

val: an integer representing Node.val
random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.

Example 1:
Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
 
Example 2:
Input: head = [[1,1],[2,1]]
Output: [[1,1],[2,1]]
 
Example 3:
Input: head = [[3,null],[3,0],[3,null]]
Output: [[3,null],[3,0],[3,null]]
 
Example 4:
Input: head = []
Output: []
Explanation: Given linked list is empty (null pointer), so return null.
 

Constraints:

-10000 <= Node.val <= 10000
Node.random is null or pointing to a node in the linked list.
Number of Nodes will not exceed 1000.
*/

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

import Foundation

extension Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next)
        hasher.combine(random)
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        
        var map: [Node: Node] = [:]
        
        var node = head
        while node != nil {
            map[node!] = Node(node!.val)
            node = node?.next
        }
        
        node = head
        while let aNode = node {
            
            if let next = aNode.next {
                map[aNode]!.next = map[next]
            }
            
            if let random = aNode.random {
                map[aNode]!.random = map[random]
            }
            
            node = aNode.next
        }
        
        return map[head!]
    }
}

import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testLeetcodeExample1() {
//        let input = ""
//        XCTAssertEqual(solution.<#func#>, <#result#>)
    }
}

SolutionTests.defaultTestSuite.run()
