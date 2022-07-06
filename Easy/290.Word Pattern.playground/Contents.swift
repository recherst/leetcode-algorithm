/**
 Given a pattern and a string s, find if s follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

  

 Example 1:
 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true
 
 Example 2:
 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false
 
 Example 3:
 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false
  

 Constraints:
 - 1 <= pattern.length <= 300
 - pattern contains only lower-case English letters.
 - 1 <= s.length <= 3000
 - s contains only lowercase English letters and spaces ' '.
 - s does not contain any leading or trailing spaces.
 - All the words in s are separated by a single space.
 */
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let letterArr = s.split(separator: " ")
        if letterArr.count != pattern.count { return false }
        var map = [pattern[pattern.startIndex]: letterArr[0]]
        for (i, c) in pattern.enumerated() {
            if i > 0 {
                if let letter = map[c] {
                    if letterArr[i] != letter {
                        return false
                    }
                } else {
                    for index in 0..<i {
                        if letterArr[i] == letterArr[index] {
                            return false
                        }
                    }
                    map[c] = letterArr[i]
                }
            }
        }
        return true
    }
}

let s = Solution()
let r = s.wordPattern("abba", "dog dog dog dog")
print(r)
