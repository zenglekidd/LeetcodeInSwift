//
//  Solution.swift
//  Solutionground
//
//  Created by Le Zeng on 2019/10/26.
//  Copyright © 2019 Le Zeng. All rights reserved.
//

/*
 121. Best Time to Buy and Sell Stock
 Easy

 Say you have an array for which the ith element is the price of a given stock on day i.

 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

 Note that you cannot sell a stock before you buy one.

 Example 1:

 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
              Not 7-1 = 6, as selling price needs to be larger than buying price.
 Example 2:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {return 0}
        
        var maxProfit = 0
        var index0 = 0
        var index1 = 0
        
        repeat {
            index1 = index0 + 1
            
            let subArray = Array(prices.dropFirst(index0 + 1))
            index1 += findMax(subArray)
            
            let subArray2 = Array(prices.dropLast(prices.count - index1).dropFirst(index0))
            index0 += findMin(subArray2)
            
            let profit = prices[index1] - prices[index0]
            if profit >= maxProfit {
                maxProfit = profit
            }
            
            index0 = index1
        } while(index0 < prices.count - 1)
        
        return maxProfit
    }
    
    fileprivate func findMin(_ prices: [Int]) -> Int {
        // return the index of Min
        if prices.count == 1 {
            return 0
        }
        
        var min = Int.max
        var index = -1
        for (currentIndex, price) in prices.enumerated() {
            if price < min {
                min = price
                index = currentIndex
            }
        }
        return index
    }
    
    fileprivate func findMax(_ prices: [Int]) -> Int {
        if prices.count == 1 {
            return 0
        }
        
        // return the index of Max
        var max = Int.min
        var index = -1
        for (currentIndex, price) in prices.enumerated() {
            if price > max {
                max = price
                index = currentIndex
            }
        }
        return index
    }
}
