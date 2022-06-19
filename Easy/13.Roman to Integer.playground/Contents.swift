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
 Given a roman numeral, convert it to an integer.

  

 Example 1:

 Input: s = "III"
 Output: 3
 Explanation: III = 3.
 Example 2:

 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 3:

 Input: s = "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
  

 Constraints:

 1 <= s.length <= 15
 s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
 It is guaranteed that s is a valid roman numeral in the range [1, 3999].
 */

// @lc code=start
class Solution {
    func romanToInt(_ s: String) -> Int {
        var resultNumber: Int = 0
        if s.count < 0 || s.count > 15 {
            return resultNumber
        }
        // 创建一个字符数组容器，装每个字符
        let characterArr = s.map { $0 }
        
        // 设置一个计数位
        var flag: Int = 0
        
        // 遍历每个字符
        for (index, c) in characterArr.enumerated() {
            if c == "I" { // 1
                if characterArr.count >= 2 {
                    if index + 1 < characterArr.count {
                        let nextElement = characterArr[index + 1]
                        if nextElement == "V" { // IV = 4
                            resultNumber += 4
                            // 计数位多加一个，下次就不用处理了
                            flag += 2
                        } else if nextElement == "X" { // IX = 9
                            resultNumber += 9
                            // 计数位多加一个，下次就不用处理了
                            flag += 2
                        } else if nextElement == "I" {
                            resultNumber += 1
                            flag += 1
                        }
                    } else if index + 1 == characterArr.count {
                        resultNumber += 1
                        flag += 1
                    }
                } else {
                    resultNumber += 1
                    flag += 1
                }
            } else if c == "V" { // 5
                if flag > index {
                    // 特殊数，上次处理过了
                    continue
                } else {
                    resultNumber += 5
                    flag += 1
                }
            } else if c == "X" { // 10
                if flag > index {
                    // 特殊数，上次处理过了
                    continue
                } else {
                    if characterArr.count >= 2 {
                        if index + 1 < characterArr.count {
                            let nextElement = characterArr[index + 1]
                            if nextElement == "L" { // XL = 40
                                resultNumber += 40
                                flag += 2
                            } else if nextElement == "C" { // XC = 90
                                resultNumber += 90
                                flag += 2
                            } else {
                                resultNumber += 10
                                flag += 1
                            }
                        } else if index + 1 == characterArr.count {
                            resultNumber += 10
                            flag += 1
                        }
                    } else {
                        resultNumber += 10
                        flag += 1
                    }
                }
            } else if c == "L" { // 50
                if flag > index {
                    // 特殊数，上次处理过了
                    continue
                } else {
                    resultNumber += 50
                    flag += 1
                }
            } else if c == "C" { // 100
                if flag > index {
                    // 特殊数，上次处理过了
                    continue
                } else {
                    if characterArr.count >= 2 {
                        if index + 1 < characterArr.count {
                            let nextElement = characterArr[index + 1]
                            if nextElement == "D" { // CD = 400
                                resultNumber += 400
                                flag += 2
                            } else if nextElement == "M" { // CM == 900
                                resultNumber += 900
                                flag += 2
                            } else {
                                resultNumber += 100
                                flag += 1
                            }
                        } else if index + 1 == characterArr.count {
                            resultNumber += 100
                            flag += 1
                        }
                    } else {
                        resultNumber += 100
                        flag += 1
                    }
                }
            } else if c == "D" { // 500
                if flag > index {
                    // 特殊数，上次处理过了
                    continue
                } else {
                    resultNumber += 500
                    flag += 1
                }
            } else if c == "M" { // 1000
                if flag > index {
                    // 特殊数，上次处理过了
                    continue
                } else {
                    resultNumber += 1000
                    flag += 1
                }
            } else {
                print("Not a Roman number!")
            }
        }
        return resultNumber
    }
}
// @lc code=end

let s = Solution()

let n = s.romanToInt("MDLXX")
print(n)





