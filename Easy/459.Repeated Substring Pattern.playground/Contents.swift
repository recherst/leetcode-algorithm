/**
 Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

  

 Example 1:
 Input: s = "abab"
 Output: true
 Explanation: It is the substring "ab" twice.
 
 Example 2:
 Input: s = "aba"
 Output: false
 
 Example 3:
 Input: s = "abcabcabcabc"
 Output: true
 Explanation: It is the substring "abc" four times or the substring "abcabc" twice.
  

 Constraints:
 - 1 <= s.length <= 104
 - s consists of lowercase English letters.
 */
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let arr: [Character] = s.map { $0 }
        var i = 1
        var j = 0
        let n = s.count
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        while i < n {
            if arr[i] == arr[j] {
                i += 1
                j += 1
                dp[i] = j
            } else if j == 0 {
                i += 1
            } else {
                j = dp[j]
            }
        }
        return dp[n] % (n - dp[n]) == 0 && dp[n] != 0
    }
}

let s = Solution()
let r = s.repeatedSubstringPattern("bb")
print(r)
