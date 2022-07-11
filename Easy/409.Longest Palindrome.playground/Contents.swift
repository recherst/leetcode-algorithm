/**
 Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

 Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

  

 Example 1:
 Input: s = "abccccdd"
 Output: 7
 Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
 
 Example 2:
 Input: s = "a"
 Output: 1
 Explanation: The longest palindrome that can be built is "a", whose length is 1.
  

 Constraints:
 - 1 <= s.length <= 2000
 - s consists of lowercase and/or uppercase English letters only.
 */
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        if s.count == 1 { return 1 }
        var map = [Character: Int]()
        for c in s {
            if var count = map[c] {
                count += 1
                map[c] = count
            } else {
                map[c] = 1
            }
        }
        var hasSingle = false
        var count = 0
        for e in map {
            if e.value > 1 {
                if e.value % 2 == 0 {
                    count += e.value
                } else {
                    if !hasSingle {
                        hasSingle = true
                        count += e.value
                    } else {
                        count += (e.value - 1)
                    }
                }
            }
        }
        return hasSingle ? count : count + 1 <= s.count ? count + 1 : s.count
    }
}

let s = Solution()
let r = s.longestPalindrome("aabbba")
print(r)
