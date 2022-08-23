/**
 Given a string s and an integer k, reverse the first k characters for every 2k characters counting from the start of the string.

 If there are fewer than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and leave the other as original.

  

 Example 1:
 Input: s = "abcdefg", k = 2
 Output: "bacdfeg"
 
 Example 2:
 Input: s = "abcd", k = 2
 Output: "bacd"
  

 Constraints:
 - 1 <= s.length <= 10^4
 - s consists of only lowercase English letters.
 - 1 <= k <= 10^4
 */
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        if s.count <= k {
            return String(s.reversed())
        } else {
            var result = s
            let quotient = s.count / (2 * k)
            let remiander = s.count % (2 * k)
            if quotient > 0 {
                for i in 0..<quotient {
                    let subString = String(s[s.index(s.startIndex, offsetBy: i * 2 * k)..<s.index(s.startIndex, offsetBy: i * 2 * k + k)].reversed())
                    result.replaceSubrange(s.index(s.startIndex, offsetBy: i * 2 * k)..<s.index(s.startIndex, offsetBy: i * 2 * k + k), with: subString)
                }
            }
            if remiander > 0 {
                if remiander >= k {
                    let subString = String(s[s.index(s.startIndex, offsetBy: quotient * 2 * k)..<s.index(s.startIndex, offsetBy: quotient * 2 * k + k)].reversed())
                    result.replaceSubrange(s.index(s.startIndex, offsetBy: quotient * 2 * k)..<s.index(s.startIndex, offsetBy: quotient * 2 * k + k), with: subString)
                } else {
                    let subString = String(s[s.index(s.startIndex, offsetBy: quotient * 2 * k)...s.index(s.startIndex, offsetBy: s.count - 1)].reversed())
                    result.replaceSubrange(s.index(s.startIndex, offsetBy: quotient * 2 * k)...s.index(s.startIndex, offsetBy: s.count - 1), with: subString)
                }
            }
            return result
        }
    }
}

let s = Solution()
let r = s.reverseStr("abcd", 2)
print(r)
