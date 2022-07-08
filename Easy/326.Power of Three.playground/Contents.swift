/**
 Given an integer n, return true if it is a power of three. Otherwise, return false.

 An integer n is a power of three, if there exists an integer x such that n == 3x.

  

 Example 1:
 Input: n = 27
 Output: true
 
 Example 2:
 Input: n = 0
 Output: false
 
 Example 3:
 Input: n = 9
 Output: true
  

 Constraints:
 - -231 <= n <= 231 - 1
  

 Follow up: Could you solve it without loops/recursion?
 */
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n <= 0 { return false }
        if n == 1 { return true }
        var num = n
        while num % 3 == 0 {
            num /= 3
        }
        return num == 1
    }
    
    func isPowerOfThree2(_ n: Int) -> Bool {
        if n < 0 { return false }
        var x = 0
        while pow(3, x) <= n {
            x += 1
        }
        return pow(3, x - 1) == n
    }
    
    private func pow(_ base: Int, _ power: Int) -> Int {
        if base == 0 { return 0 }
        var res = 1
        for _ in 0..<abs(power) {
            res *= base
        }
        return res
    }
}

let s = Solution()
let r = s.isPowerOfThree(1)
print(r)
