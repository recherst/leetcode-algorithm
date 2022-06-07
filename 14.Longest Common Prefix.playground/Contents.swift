import Darwin
/**
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  
 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  

 Constraints:

 - 1 <= strs.length <= 200
 - 0 <= strs[i].length <= 200
 - strs[i] consists of only lower-case English letters.
 */

// @lc code=start
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 1 { return strs[0] }
        var flag = strs[0].count
        for str in strs.dropFirst() {
            if str.count < flag {
                flag = str.count
            }
            for (i, s) in str.enumerated() {
                for (j, c) in strs[0].enumerated() {
                    if i == j && s != c {
                        if j < flag {
                            flag = j
                        }
                    }
                }
            }
        }
        return String(strs[0].prefix(flag))
    }
}
// @lc code=end

let strs = ["ab", "a"]
let s = Solution()
print(s.longestCommonPrefix(strs))
