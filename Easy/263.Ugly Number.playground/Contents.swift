/**
 An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.

 Given an integer n, return true if n is an ugly number.

  

 Example 1:
 Input: n = 6
 Output: true
 Explanation: 6 = 2 × 3
 
 Example 2:
 Input: n = 1
 Output: true
 Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.
 
 Example 3:
 Input: n = 14
 Output: false
 Explanation: 14 is not ugly since it includes the prime factor 7.
  

 Constraints:
 - -231 <= n <= 231 - 1
 */
class Solution {
    func isUgly(_ n: Int) -> Bool {
        if n == 0 { return false }
        var num = n
        while num % 2 == 0 || num % 3 == 0 || num % 5 == 0 {
            if num % 2 == 0 {
                num /= 2
            }
            if num % 3 == 0 {
                num /= 3
            }
            if num % 5 == 0 {
                num /= 5
            }
        }
        
        if num == 1 { return true }
        return false
    }
}
