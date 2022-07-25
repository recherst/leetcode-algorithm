/**
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:
 Input: x = 123
 Output: 321
 
 Example 2:
 Input: x = -123
 Output: -321
 
 Example 3:
 Input: x = 120
 Output: 21
  

 Constraints:
 - -231 <= x <= 231 - 1
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        let str = "\(abs(x))"
        var i = str.count - 1
        var res = ""
        while i >= 0 {
            let e = str[str.index(str.startIndex, offsetBy: i)]
            res.append(e)
            i -= 1
        }
        
        if let res = Int(res) {
            if x > 0 {
                return res >= 2147483647 ? 0 : res
            } else {
                return -res <= -2147483648 ? 0 : -res
            }
        } else {
            return 0
        }
    }
}

let s = Solution()
let r = s.reverse(-2147483648)
print(r)
