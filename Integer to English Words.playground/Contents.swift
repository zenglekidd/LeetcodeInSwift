import Cocoa
/*
 273. Integer to English Words
 Hard

 Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

 Example 1:
 Input: 123
 Output: "One Hundred Twenty Three"
 
 Example 2:
 Input: 12345
 Output: "Twelve Thousand Three Hundred Forty Five"
 
 Example 3:
 Input: 1234567
 Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 
 Example 4:
 Input: 1234567891
 Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
 */

class Solution {
    func numberToWords(_ num: Int) -> String {
        let oneBillion = 1000000000
        let billion = num / oneBillion
        if billion > 0 {
            let nineDigits = num % oneBillion
            var result = "\(belowOneBillion(billion)) billion"
            if nineDigits != 0 {
                result = result + " \(belowOneBillion(num % oneBillion))"
            }
            return result.capitalized
        } else {
            return belowOneBillion(num).capitalized
        }
    }
    
    private func belowOneBillion(_ num: Int) -> String {
        let oneBillion = 1000000000
        if num >= oneBillion || num < 0 {
            return "Not a nine digit"
        }
        
        let oneMillion = 1000000
        let million = num / oneMillion
        if million > 0 {
            let sixDigits = num % oneMillion
            var result = "\(belowOneMillion(million)) million"
            if sixDigits != 0 {
                result = result + " \(belowOneMillion(num % oneMillion))"
            }
            return result
        } else {
            return belowOneMillion(num)
        }
    }
    
    private func belowOneMillion(_ num: Int) -> String {
        if num > 999999 || num < 0 {
            return "Not a six digit"
        }
        
        let thousand = num / 1000
        if thousand > 0 {
            let threeDigits = num % 1000
            var result = "\(belowOneThousand(thousand)) thousand"
            if threeDigits != 0 {
                result = result + " \(belowOneThousand(num % 1000))"
            }
            return result
        } else {
            return belowOneThousand(num)
        }
    }
    
    private func belowOneThousand(_ num: Int) -> String {
        if num > 999 || num < 0 {
            return "Not a three digit"
        }
        
        let hundred = num / 100
        if hundred > 0 {
            let twoDigits = num % 100
            var result = "\(singleDigitToWord(hundred)) hundred"
            if twoDigits != 0 {
                result = result + " \(doubleDigitsToWord(num % 100))"
            }
            return result
        } else {
            return doubleDigitsToWord(num)
        }
    }
    
    private func singleDigitToWord(_ num: Int) -> String {
        if num > 9 || num < 0 {
            return "Not a single digit"
        }
        
        let dict = [0:"zero",
                    1:"one",
                    2:"two",
                    3:"three",
                    4:"four",
                    5:"five",
                    6:"six",
                    7:"seven",
                    8:"eight",
                    9:"nine",
        ]
        return dict[num]!
    }
    
    private func doubleDigitsToWord(_ num: Int) -> String {
        if num > 99 || num < 0 {
            return "Not a double digit"
        }
        
        let belowTwenty = [
            10:"ten",
            11:"eleven",
            12:"twelve",
            13:"thirteen",
            14:"fourteen",
            15:"fifteen",
            16:"sixteen",
            17:"seventeen",
            18:"eighteen",
            19:"nineteen",
        ]
        
        let tens = [
            2:"twenty",
            3:"thirty",
            4:"forty",
            5:"fifty",
            6:"sixty",
            7:"seventy",
            8:"eighty",
            9:"ninety",
        ]
        
        if num < 10 {
            return singleDigitToWord(num)
        } else if num >= 10 && num < 20 {
            return belowTwenty[num]!
        } else {
            let tensDigit = num / 10
            let onesDigit = num % 10
            
            var result = "\(tens[tensDigit]!)"
            if onesDigit != 0 {
                result = result + " \(singleDigitToWord(onesDigit))"
            }
            return result
        }
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
        let results = solution.numberToWords(123)
        XCTAssertEqual(results, "One Hundred Twenty Three")
    }

    func testExample2() {
        let results = solution.numberToWords(12345)
        XCTAssertEqual(results, "Twelve Thousand Three Hundred Forty Five")
    }

    func testExample3() {
        let results = solution.numberToWords(1234567)
        XCTAssertEqual(results, "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven")
    }

    func testExample4() {
        let results = solution.numberToWords(1234567891)
        XCTAssertEqual(results, "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One")
    }
    
    func testExample5() {
        let results = solution.numberToWords(20)
        XCTAssertEqual(results, "Twenty")
    }
    
    func testExample6() {
        let results = solution.numberToWords(300)
        XCTAssertEqual(results, "Three Hundred")
    }
    
    func testExample7() {
        let results = solution.numberToWords(4000)
        XCTAssertEqual(results, "Four Thousand")
    }
    
    func testExample8() {
        let results = solution.numberToWords(6000000)
        XCTAssertEqual(results, "Six Million")
    }
    
    func testExample9() {
        let results = solution.numberToWords(9000000000)
        XCTAssertEqual(results, "Nine Billion")
    }
    
//    func testExample5() {
//        let results = solution.numberToWords(2147483647)
//        XCTAssertEqual(results, "One")
//    }
}

SolutionTests.defaultTestSuite.run()
