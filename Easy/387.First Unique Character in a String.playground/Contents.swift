/**
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

  

 Example 1:
 Input: s = "leetcode"
 Output: 0
 
 Example 2:
 Input: s = "loveleetcode"
 Output: 2
 
 Example 3:
 Input: s = "aabb"
 Output: -1
  

 Constraints:
 - 1 <= s.length <= 105
 - s consists of only lowercase English letters.
 */
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let newStr = s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]
        var mapArr = [[s[s.startIndex]: 1]]
        for c in newStr {
            for (i, var v) in mapArr.enumerated() {
                if v.keys.first! == c {
                    var count = v.values.first!
                    count += 1
                    v[c] = count
                    mapArr[i] = v
                    break
                } else {
                    if i == mapArr.count - 1 {
                        mapArr.append([c: 1])
                    }
                }
            }
        }
        
        var firstLetter: Character? = nil
        for arr in mapArr {
            if arr.values.first! == 1 {
                firstLetter = arr.keys.first!
                break
            }
        }
        guard let firstLetter = firstLetter else { return -1 }
        for (i, c) in s.enumerated() {
            if c == firstLetter {
                return i
            }
        }
        return -1
    }
}

let s = Solution()
let r = s.firstUniqChar("leetcode")
print(r)
