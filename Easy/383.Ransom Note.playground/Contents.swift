/**
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

  

 Example 1:
 Input: ransomNote = "a", magazine = "b"
 Output: false
 
 Example 2:
 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 
 Example 3:
 Input: ransomNote = "aa", magazine = "aab"
 Output: true
  

 Constraints:
 - 1 <= ransomNote.length, magazine.length <= 105
 - ransomNote and magazine consist of lowercase English letters.
 */
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let targetArr: [Character] = ransomNote.map { $0 }
        var sourceArr: [Character] = magazine.map { $0 }
        var totalCount = 0
        for(i, c1) in targetArr.enumerated() {
            var deleteCount = 0
            for (j, c2) in sourceArr.enumerated() {
                if i == totalCount {
                    if c1 == c2 {
                        sourceArr.remove(at: j - deleteCount)
                        deleteCount += 1
                        totalCount += deleteCount
                        break
                    }
                } else {
                    return false
                }
            }
        }
        return totalCount == targetArr.count
    }
}

let s = Solution()
let r = s.canConstruct("aa", "abb")
print(r)
