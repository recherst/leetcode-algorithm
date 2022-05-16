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
        // 先找出最短的那个字符串
        var shortestStr = strs.first ?? ""
        var length = strs[0].count
        var index = 0
        var copyStrs = strs
        for (i, str) in strs.dropFirst().enumerated() {
            if str.count < length {
                length = str.count
                shortestStr = str
                index = i + 1
            }
        }
        // 移除最短的一个后，再遍历
        copyStrs.remove(at: index)
        var flag = shortestStr.count
        loop1: for str in copyStrs {
            loop2: for (i, s) in str.enumerated() {
                loop3: for (j, c) in shortestStr.enumerated() {
                    if i == j && s != c {
                        // flag 会被找到很多次，我们要找出一个最小的
                        if j < flag {
                            flag = j
                        }
                        break loop2
                    }
                }
            }
        }
        
        return String(shortestStr.prefix(flag))
    }
}
// @lc code=end

let strs = ["reflower","flow","flight"]
let s = Solution()
print(s.longestCommonPrefix(strs))
