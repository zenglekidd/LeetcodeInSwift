/*
 211. Add and Search Word - Data structure design
 Medium

 Design a data structure that supports the following two operations:

 void addWord(word)
 bool search(word)
 search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.

 Example:

 addWord("bad")
 addWord("dad")
 addWord("mad")
 search("pad") -> false
 search("bad") -> true
 search(".ad") -> true
 search("b..") -> true
 Note:
 You may assume that all words are consist of lowercase letters a-z.
 */

import Foundation

class WordDictionary: CustomStringConvertible {
    var hasCompleteWord: Bool = false
    var children: [Character: WordDictionary] = [:]
    var val: Character? // Only root has a nil value
    
    /** Initialize your data structure here. */
    init() {
        children.reserveCapacity(26)
    }
    
    var description: String {
        if children.isEmpty {
            return "current: \(val ?? "$"), ended. Empty children.\n"
        } else {
            var result = ""
            if hasCompleteWord {
                result = "current: \(val ?? "$"), ended \n"
            } else {
                result = "current: \(val ?? "$") \n"
            }

            for key in children.keys.sorted() {
                let t = children[key]!
                result.append(t.description)
            }
            
            return result
        }
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        if word.isEmpty {
            return
        }
        
        let first = word.first!
        if word.count == 1 {
            if children.keys.contains(first) {
                children[first]!.hasCompleteWord = true
                children[first]!.addWord("")
            } else {
                let child = WordDictionary()
                child.val = first
                child.hasCompleteWord = true
                children[first] = child
            }
            return
        }
        
        
        var currentWord = word
        currentWord.removeFirst()
        
        if children.keys.contains(first) {
            children[first]!.addWord(currentWord)
        } else {
            let child = WordDictionary()
            child.val = first
            children[first] = child
            child.addWord(currentWord)
        }
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        if word.isEmpty {
            return true
        }
        
        let first = word.first!
        if word.count == 1 {
            if first == "." {
                var result = false
                for (_ , value) in children {
                    result = result || value.hasCompleteWord
                }
                return result
            }
            
            if children.keys.contains(first) == false {
                return false
            } else {
                let child = children[first]!
                return (first == "." || child.hasCompleteWord)
            }
        }
        
        if children.isEmpty && word.count > 1 {
            return false
        }
        
        if first == "." {
            var currentWord = word
            currentWord.removeFirst()
            var result = false
            for (_ , value) in children {
                result = result || value.search(currentWord)
            }
            return result
        }
        
        if children.keys.contains(first) == true {
            var currentWord = word
            currentWord.removeFirst()
            return children[first]!.search(currentWord)
        } else {
            return false
        }
    }
}

class Solution {

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
        let trie = WordDictionary()
        trie.addWord("bad")
        trie.addWord("dad")
        trie.addWord("mad")
        XCTAssertEqual(trie.search("pad"), false)
        XCTAssertEqual(trie.search("bad"), true)
        XCTAssertEqual(trie.search("ba"), false)
        XCTAssertEqual(trie.search(".ad"), true)
        XCTAssertEqual(trie.search("b.."), true)
        print(trie)
    }
}

SolutionTests.defaultTestSuite.run()
