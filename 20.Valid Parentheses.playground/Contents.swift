/**
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
  

 Constraints:
 - 1 <= s.length <= 104
 - s consists of parentheses only '()[]{}'.
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
