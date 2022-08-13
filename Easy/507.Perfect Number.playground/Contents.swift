import Darwin
/**
 A perfect number is a positive integer that is equal to the sum of its positive divisors, excluding the number itself. A divisor of an integer x is an integer that can divide x evenly.

 Given an integer n, return true if n is a perfect number, otherwise return false.

  

 Example 1:
 Input: num = 28
 Output: true
 Explanation: 28 = 1 + 2 + 4 + 7 + 14
 1, 2, 4, 7, and 14 are all divisors of 28.
 
 Example 2:
 Input: num = 7
 Output: false
  

 Constraints:
 - 1 <= num <= 10^8
 */
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num < 4 { return false }
        let root = Int(sqrt(Double(num)))
        var sum = 0
        for i in 2...root {
            if num % i == 0 {
                sum += i
                sum += (num / i)
            }
        }
        sum += 1
        return sum == num
    }
}

let s = Solution()
let r = s.checkPerfectNumber(2)
print(r)
