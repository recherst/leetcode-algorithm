/**
 Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.

  

 Example 1:
 Input: n = 5
 Output: true
 Explanation: The binary representation of 5 is: 101
 
 Example 2:
 Input: n = 7
 Output: false
 Explanation: The binary representation of 7 is: 111.
 
 Example 3:
 Input: n = 11
 Output: false
 Explanation: The binary representation of 11 is: 1011.
  

 Constraints:
 - 1 <= n <= 231 - 1
 */
class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var x = 0
        while pow(2, power: x) <= n {
            x += 1
        }
        var arr = Array(repeating: 0, count: x)
        
        var i = n
        while i != 0 {
            var x = 0
            while pow(2, power: x) <= i {
                x += 1
            }
            arr[x - 1] = 1
            i -= pow(2, power: x - 1)
        }
        
        for (i, c) in arr.enumerated() {
            if i > 0 {
                if c == 0 && arr[i - 1] == 0 {
                    return false
                } else if c == 1 && arr[i - 1] == 1 {
                    return false
                }
            }
        }
        
        return true
    }
    
    private func pow(_ base: Int, power: Int) -> Int {
        if base == 0 { return 0 }
        var result = 1
        for _ in 0..<power {
            result *= base
        }
        return result
    }
}

let s = Solution()
let r = s.hasAlternatingBits(4)
print(r)
