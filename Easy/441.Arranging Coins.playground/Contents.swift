/**
 You have n coins and you want to build a staircase with these coins. The staircase consists of k rows where the ith row has exactly i coins. The last row of the staircase may be incomplete.

 Given the integer n, return the number of complete rows of the staircase you will build.

  

 Example 1:
 Input: n = 5
 Output: 2
 Explanation: Because the 3rd row is incomplete, we return 2.
 
 Example 2:
 Input: n = 8
 Output: 3
 Explanation: Because the 4th row is incomplete, we return 3.
 */
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        if n == 1 || n == 2 { return 1 }
        if n == 3 { return 2 }
        var k = 3
        while (n - k * (k - 1) / 2 > 0) && (n - k * (k - 1) / 2 > k) {
            k += 1
        }
        return n - k * (k - 1) / 2 == k ? k : k - 1
    }
}

let s = Solution()
let r = s.arrangeCoins(3)
print(r)
