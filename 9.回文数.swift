/**
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 例如，121 是回文，而 123 不是。
  

 示例 1：
 输入：x = 121
 输出：true
 
 示例 2：
 输入：x = -121
 输出：false
 解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 
 示例 3：
 输入：x = 10
 输出：false
 解释：从右向左读, 为 01 。因此它不是一个回文数。
 */

/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

// @lc code=start
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x >= 0 {
            if x >= 10 {
                let str = String(x)
                for i in 0..<str.count / 2 {
                    let index = str.index(str.startIndex, offsetBy: i)
                    let lastIndex = str.index(str.startIndex, offsetBy: str.count - 1 - i)
                    if str[index] != str[lastIndex] {
                        return false
                    }
                }
                return true
            } else {
                return true
            }
        } else {
            return false
        }
    }
}
// @lc code=end

