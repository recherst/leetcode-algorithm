/**
 Given a positive integer num, write a function which returns True if num is a perfect square else False.

 Follow up: Do not use any built-in library function such as sqrt.

  

 Example 1:
 Input: num = 16
 Output: true
 
 Example 2:
 Input: num = 14
 Output: false
  

 Constraints:
 - 1 <= num <= 2^31 - 1
 */
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var x = 1
        while x * x <= num {
            x += 1
        }
        return (x - 1) * (x - 1) == num
    }
}

let s = Solution()
let r = s.isPerfectSquare(4)
print(r)
