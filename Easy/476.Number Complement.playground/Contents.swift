/**
 The complement of an integer is the integer you get when you flip all the 0's to 1's and all the 1's to 0's in its binary representation.

 For example, The integer 5 is "101" in binary and its complement is "010" which is the integer 2.
 Given an integer num, return its complement.

  

 Example 1:
 Input: num = 5
 Output: 2
 Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
 
 Example 2:
 Input: num = 1
 Output: 0
 Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
  

 Constraints:
 - 1 <= num < 231
  

 Note: This question is the same as 1009: https://leetcode.com/problems/complement-of-base-10-integer/
 */
class Solution {
    func findComplement(_ num: Int) -> Int {
        var x = 0
        while pow(2, x) <= num {
            x += 1
        }
        x -= 1
        var arr = decimalToBinary(num, maxBit: x)
        print(arr)
        arr = arr.map { $0 == 1 ? 0 : 1 }
        print(arr)
        var res = 0
        for (i, e) in arr.enumerated() {
            if e == 1 {
                res += pow(2, i)
            }
        }
        return res
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
        var arr = Array(repeating: 0, count: bit + 1)
        while i >= 0 && n > 0 {
            while pow(2, i) <= n {
                n -= pow(2, i)
                arr[i] = 1
            }
            i -= 1
        }
        return arr
    }
}


let s = Solution()
let r = s.findComplement(18)
print(r)
