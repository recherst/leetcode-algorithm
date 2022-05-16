import Darwin
/**
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。

  
 示例 1：
 输入：strs = ["flower","flow","flight"]
 输出："fl"
 
 示例 2：
 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。

 提示：
 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] 仅由小写英文字母组成
 */

/*
 * @lc app=leetcode.cn id=14 lang=swift
 *
 * [14] 最长公共前缀
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
