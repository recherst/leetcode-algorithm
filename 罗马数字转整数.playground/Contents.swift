import UIKit

/**
 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1 。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。


 示例 1:
 输入: s = "III"
 输出: 3
 
 示例 2:
 输入: s = "IV"
 输出: 4
 
 示例 3:
 输入: s = "IX"
 输出: 9
 
 示例 4:
 输入: s = "LVIII"
 输出: 58
 解释: L = 50, V= 5, III = 3.
 
 示例 5:
 输入: s = "MCMXCIV"
 输出: 1994
 解释: M = 1000, CM = 900, XC = 90, IV = 4.
  

 提示：
 1 <= s.length <= 15
 s 仅含字符 ('I', 'V', 'X', 'L', 'C', 'D', 'M')
 题目数据保证 s 是一个有效的罗马数字，且表示整数在范围 [1, 3999] 内
 题目所给测试用例皆符合罗马数字书写规则，不会出现跨位等情况。
 IL 和 IM 这样的例子并不符合题目要求，49 应该写作 XLIX，999 应该写作 CMXCIX 。
 关于罗马数字的详尽书写规则，可以参考 罗马数字 - Mathematics 。
 */

/*
 * @lc app=leetcode.cn id=13 lang=swift
 *
 * [13] 罗马数字转整数
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





