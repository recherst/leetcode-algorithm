import Darwin
/**
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

  

 Example 1:
 Input: s = "egg", t = "add"
 Output: true
 
 Example 2:
 Input: s = "foo", t = "bar"
 Output: false
 
 Example 3:
 Input: s = "paper", t = "title"
 Output: true
  

 Constraints:
 - 1 <= s.length <= 5 * 104
 - t.length == s.length
 - s and t consist of any valid ascii character.
 */
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s == t { return true }
        var stDict = [Character: Character]()
        var tsDict = [Character: Character]()
        let sArr = Array(s)
        let tArr = Array(t)
        for (i, c1) in sArr.enumerated() {
            let c2 = tArr[i]
            if stDict[c1] == nil && tsDict[c2] == nil {
                stDict[c1] = c2
                tsDict[c2] = c1
            } else if stDict[c1] != c2 || tsDict[c2] != c1 {
                return false
            }
        }
        return true
    }
}

let s = Solution()
let r = s.isIsomorphic("abcdefghijklmnopqrstuvwxyzva", "abcdefghijklmnopqrstuvwxyzck")
print(r)
