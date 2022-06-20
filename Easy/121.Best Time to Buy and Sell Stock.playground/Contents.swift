/**
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

  

 Example 1:
 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 
 Example 2:
 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.
  

 Constraints:
 - 1 <= prices.length <= 105
 - 0 <= prices[i] <= 104
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var max = prices[0]
        var min = prices[0]
        var buySellPair = [[Int]]()
        
        for i in 1..<prices.count {
            if prices[i] < min {
                min = prices[i]
                max = prices[i]
            } else {
                max = prices[i]
                buySellPair.append([min, max])
            }
        }
        var deltaMax = 0
        for e in buySellPair {
            let diff = e[1] - e[0]
            if diff > deltaMax {
                deltaMax = diff
            }
        }
        return deltaMax
    }
}

let s = Solution()
let r = s.maxProfit([7,6,4,3,1])
print(r)
