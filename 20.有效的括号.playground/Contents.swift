/**
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
  

 示例 1：
 输入：s = "()"
 输出：true
 
 示例 2：
 输入：s = "()[]{}"
 输出：true
 
 示例 3：
 输入：s = "(]"
 输出：false
 
 示例 4：
 输入：s = "([)]"
 输出：false
 
 示例 5：
 输入：s = "{[]}"
 输出：true
  
 
 提示：
 1 <= s.length <= 104
 s 仅由括号 '()[]{}' 组成
 */

/*
 * @lc app=leetcode.cn id=20 lang=swift
 *
 * [20] 有效的括号
 */

// @lc code=start
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for c in s {
            switch c {
            case "(":
                stack.append(c)
            case "{":
                stack.append(c)
            case "[":
                stack.append(c)
            case ")":
                let element = stack.popLast()
                if element != "(" {
                    return false
                }
            case "}":
                let element = stack.popLast()
                if element != "{" {
                    return false
                }
            case "]":
                let element = stack.popLast()
                if element != "[" {
                    return false
                }
            default:
                return false
            }
        }
        if stack.isEmpty { return true }
        return false
    }
}
// @lc code=end

let s = Solution()
let r = s.isValid("{}[")
print(r)
