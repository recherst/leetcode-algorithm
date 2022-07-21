/**
 Given an integer num, return a string of its base 7 representation.

  

 Example 1:
 Input: num = 100
 Output: "202"
 
 Example 2:
 Input: num = -7
 Output: "-10"
  

 Constraints:
 - -107 <= num <= 107

 */
class Solution {
    func convertToBase7(_ num: Int) -> String {
        if num == 0 { return "0" }
        var x = 0
        while pow(7, x) <= abs(num) {
            x += 1
        }
        x -= 1
        let res = decimalToBinary(abs(num), maxBit: x)
        return num > 0 ? res.lazy.reversed().map { String($0) }.joined() : "-" + res.lazy.reversed().map { String($0) }.joined()
    }
    
    private func pow(_ base: Int, _ power: Int) -> Int {
        if base == 0 { return 0 }
        var res = 1
        for _ in 0..<power {
            res *= base
        }
        return res
    }
    
    private func decimalToBinary(_ num: Int, maxBit bit: Int) -> [Int] {
        var n = num
        var i = bit
        var arr = Array(repeating: 0, count: i + 1)
        while i >= 0 && n > 0 {
            var x = 1
            while x * pow(7, i) <= n {
                x += 1
            }
            x -= 1
            n -= x * pow(7, i)
            arr[i] = x
            i -= 1
        }
        return arr
    }
}

let s = Solution()
let r = s.convertToBase7(100)
print(r)
