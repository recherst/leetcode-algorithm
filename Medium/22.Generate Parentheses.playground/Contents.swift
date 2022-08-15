/**
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

  

 Example 1:
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 
 Example 2:
 Input: n = 1
 Output: ["()"]
  

 Constraints:
 - 1 <= n <= 8
 */
class Solution {
    private var result = [String]()
    
    func generateParenthesis(_ n: Int) -> [String] {
        dfs(left: n, right: n, currentString: "")
        return result
    }
    
    private func dfs(left: Int, right: Int, currentString: String) {
        if left == 0 && right == 0 {
            result.append(currentString)
            return
        }
        if left > 0 {
            dfs(left: left - 1, right: right, currentString: currentString + "(")
        }
        if right > left {
            dfs(left: left, right: right - 1, currentString: currentString + ")")
        }
    }
}

let s = Solution()
let r = s.generateParenthesis(8)
print(r)
