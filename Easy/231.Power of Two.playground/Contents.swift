/**
 Given an integer n, return true if it is a power of two. Otherwise, return false.

 An integer n is a power of two, if there exists an integer x such that n == 2x.

  

 Example 1:
 Input: n = 1
 Output: true
 Explanation: 20 = 1
 
 Example 2:
 Input: n = 16
 Output: true
 Explanation: 24 = 16
 
 Example 3:
 Input: n = 3
 Output: false
  

 Constraints:
 - -231 <= n <= 231 - 1
  

 Follow up: Could you solve it without loops/recursion?
 */
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0  { return false }
        var x = 0
        while pow(2, pow: x) <= n {
            x += 1
        }
        return pow(2, pow: x - 1) == n
    }
    
    private func pow(_ base: Int, pow: Int) -> Int {
        var res = 1
        for _ in 0..<pow {
            res *= base
        }
        return res
    }
}

let s = Solution()
let r = s.isPowerOfTwo(0)
print(r)
