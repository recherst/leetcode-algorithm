/**
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  

 Example 1:
 Input: s = "abc", t = "ahbgdc"
 Output: true
 
 Example 2:
 Input: s = "axc", t = "ahbgdc"
 Output: false
  

 Constraints:
 - `0 <= s.length <= 100`
 - `0 <= t.length <= 104`
 - `s` and `t` consist only of lowercase English letters.
  

 ***Follow up**: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
 */
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var tStr = t
        var removedArr = [[Character: Int]]()
        var deleteCount = 0
        for (i, c1) in s.enumerated() {
            for (j, c2) in tStr.enumerated() {
                if i == deleteCount {
                    if c1 == c2 {
                        if let dict = removedArr.last {
                            if dict.first!.value > j {
                                continue
                            }
                        }
                        let index = tStr.index(tStr.startIndex, offsetBy: j)
                        tStr.remove(at: index)
                        removedArr.append([c1: j])
                        deleteCount += 1
                        break
                    }
                } else {
                    return false
                }
            }
        }
        return removedArr.count == s.count
    }
}

let s = Solution()
let r = s.isSubsequence("ab", "baab")
print(r)
