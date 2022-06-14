/**
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  

 Example 1:
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
  

 Constraints:
 - 1 <= n <= 45
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        var sumArr = [1, 2]
        // sumArr[i] = sumArr[i - 1] + sumArr[i -2]
        for i in 2..<n {
            sumArr.insert(sumArr[i - 1] + sumArr[i - 2], at: i)
        }
        return sumArr[n - 1]
    }
}

let s = Solution()
let r = s.climbStairs(6)
print(r)
