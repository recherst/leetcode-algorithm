/**
 Implement strStr().

 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

  
 Example 1:
 Input: haystack = "hello", needle = "ll"
 Output: 2
 
 Example 2:
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
  

 Constraints:
 - 1 <= haystack.length, needle.length <= 104
 - haystack and needle consist of only lowercase English characters.
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !haystack.isEmpty else { return -1 }
        if haystack.count < needle.count { return -1 }
        if needle.isEmpty { return 0 }
        if haystack == needle { return 0 }
        let subStrCount = haystack.count - needle.count
        for i in 0...subStrCount {
            let firstIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let lastIndex = haystack.index(firstIndex, offsetBy: needle.count)
            let subStr = haystack[firstIndex..<lastIndex]
            if subStr == needle {
                return i
            }
        }
        return -1
    }
}

let s = Solution()
let r = s.strStr("abc", "c")
print(r)
