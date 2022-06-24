/**
 Write an algorithm to determine if a number n is happy.

 A happy number is a number defined by the following process:

 - Starting with any positive integer, replace the number by the sum of the squares of its digits.
 - Repeat the process until the number equals 1 (where it will stay), or it **loops endlessly in a cycle** which does not include 1.
 - Those numbers for which this process **ends in 1** are happy.
 Return `true` if `n` is a happy number, and `false` if not.

  

 Example 1:
 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 
 Example 2:
 Input: n = 2
 Output: false
  
 Constraints:
 - 1 <= n <= 231 - 1
 */
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var num = n
        var mapNum = [Int:Int]()
        while mapNum[num] == nil {
            if num == 1 {
                return true
            } else {
                mapNum[num] = 1
                let numStr = "\(num)"
                num = 0
                for e in numStr {
                    num += Int(String(e))! * Int(String(e))!
                }
            }
        }
        return false
    }
}

let s = Solution()
let r = s.isHappy(7)
print(r)
