/**
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given an integer, convert it to a roman numeral.

  

 Example 1:
 Input: num = 3
 Output: "III"
 Explanation: 3 is represented as 3 ones.
 
 Example 2:
 Input: num = 58
 Output: "LVIII"
 Explanation: L = 50, V = 5, III = 3.
 
 Example 3:
 Input: num = 1994
 Output: "MCMXCIV"
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
  

 Constraints:
 - 1 <= num <= 3999
 */
class Solution {
    func intToRoman(_ num: Int) -> String {
        var n = num
        var res = ""
        while n != 0 {
            if n >= 1000 {
                n -= 1000
                res.append("M")
                continue
            } else if n >= 900 {
                n -= 900
                res.append("CM")
                continue
            } else if n >= 500 {
                n -= 500
                res.append("D")
                continue
            } else if n >= 400 {
                n -= 400
                res.append("CD")
            } else if n >= 100 && n < 400 {
                n -= 100
                res.append("C")
                continue
            } else if n >= 90 {
                n -= 90
                res.append("XC")
                continue
            } else if n >= 50 {
                n -= 50
                res.append("L")
                continue
            } else if n >= 40 {
                n -= 40
                res.append("XL")
                continue
            } else if n >= 10 && n < 40 {
                n -= 10
                res.append("X")
                continue
            } else if n >= 9 {
                n -= 9
                res.append("IX")
                continue
            } else if n >= 5 {
                n -= 5
                res.append("V")
                continue
            } else if n >= 4 {
                n -= 4
                res.append("IV")
                continue
            } else if n >= 1 {
                n -= 1
                res.append("I")
            }
        }
        return res
    }
}

let s = Solution()
let r = s.intToRoman(1494)
print(r)
