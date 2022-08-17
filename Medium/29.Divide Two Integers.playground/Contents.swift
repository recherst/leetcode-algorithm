/**
 Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.

 The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.

 Return the quotient after dividing dividend by divisor.

 Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231, 231 − 1]. For this problem, if the quotient is strictly greater than 231 - 1, then return 231 - 1, and if the quotient is strictly less than -231, then return -231.

  

 Example 1:
 Input: dividend = 10, divisor = 3
 Output: 3
 Explanation: 10/3 = 3.33333.. which is truncated to 3.
 
 Example 2:
 Input: dividend = 7, divisor = -3
 Output: -2
 Explanation: 7/-3 = -2.33333.. which is truncated to -2.
  

 Constraints:
 - -231 <= dividend, divisor <= 231 - 1
 - divisor != 0
 */
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 1 {
            if dividend > 2147483647 {
                return 2147483647
            } else {
                if dividend < -2147483648 {
                    return -2147483648
                } else {
                    return dividend
                }
            }
        }
        if divisor == -1 {
            if -dividend > 2147483647 {
                return 2147483647
            } else {
                if -dividend < -2147483648 {
                    return -2147483648
                } else {
                    return -dividend
                }
            }
        }
        
        let nagetive = (dividend ^ divisor) < 0
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var result = 0
        var i = 31
        while i >= 0 {
            if dividend >> i >= divisor {
                result += (1 << i)
                dividend -= (divisor << i)
            }
            i -= 1
        }
        if result < -2147483648 {
            result = -2147483648
        }
        if result > 2147483647 {
            result = 2147483647
        }
        return nagetive ? -result : result
    }
}

let s = Solution()
let r = s.divide(100, 3)
print(r)
