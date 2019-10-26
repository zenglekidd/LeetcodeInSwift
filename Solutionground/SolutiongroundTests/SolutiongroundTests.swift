//
//  SolutiongroundTests.swift
//  SolutiongroundTests
//
//  Created by Le Zeng on 2019/10/26.
//  Copyright © 2019 Le Zeng. All rights reserved.
//

import XCTest
@testable import Solutionground

class SolutiongroundTests: XCTestCase {

    var solution: Solution!
    
    override func setUp() {
        solution = Solution()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTwoPricePositive() {
        let results = solution.maxProfit([5,6])
        XCTAssertEqual(results, 1)
    }

    func testTwoPriceNegative() {
        let results = solution.maxProfit([10,6])
        XCTAssertEqual(results, 0)
    }
    
    func testThreePricePositive() {
        let results = solution.maxProfit([5,6,7])
        XCTAssertEqual(results, 2)
    }


    func testExample1() {
        let results = solution.maxProfit([7,1,5,3,6,4])
        XCTAssertEqual(results, 5)
    }

    func testExample2() {
        let results = solution.maxProfit([7,6,4,3])
        XCTAssertEqual(results, 0)
    }

}
