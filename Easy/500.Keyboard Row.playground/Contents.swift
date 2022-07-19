/**
 Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.

 In the American keyboard:

 the first row consists of the characters "qwertyuiop",
 the second row consists of the characters "asdfghjkl", and
 the third row consists of the characters "zxcvbnm".

  

 Example 1:
 Input: words = ["Hello","Alaska","Dad","Peace"]
 Output: ["Alaska","Dad"]
 
 Example 2:
 Input: words = ["omk"]
 Output: []
 
 Example 3:
 Input: words = ["adsdf","sfd"]
 Output: ["adsdf","sfd"]
  

 Constraints:
 - 1 <= words.length <= 20
 - 1 <= words[i].length <= 100
 - words[i] consists of English letters (both lowercase and uppercase).
 */
class Solution {
    func findWords(_ words: [String]) -> [String] {
        let row1 = "qwertyuiop"
        let row2 = "asdfghjkl"
        let row3 = "zxcvbnm"
        var res = [String]()
        for e in words {
            let e1 = Set(e.map { $0 })
            let first: Character = e1.first!
            if row1.contains(first.isLowercase ? first : Character(first.lowercased())) {
                var flag = true
                for c in e1 {
                    if !row1.contains(c.isLowercase ? c : Character(c.lowercased())) {
                        flag = false
                        continue
                    }
                }
                if flag {
                    res.append(e)
                }
            }
            if row2.contains(first.isLowercase ? first : Character(first.lowercased())) {
                var flag = true
                for c in e1 {
                    if !row2.contains(c.isLowercase ? c : Character(c.lowercased())) {
                        flag = false
                        continue
                    }
                }
                if flag {
                    res.append(e)
                }
            }
            if row3.contains(first.isLowercase ? first : Character(first.lowercased())) {
                var flag = true
                for c in e1 {
                    if !row3.contains(c.isLowercase ? c : Character(c.lowercased())) {
                        flag = false
                        continue
                    }
                }
                if flag {
                    res.append(e)
                }
            }
        }
        return res
    }
}

let s = Solution()
let r = s.findWords(["Hello","Alaska","Dad","Peace"])
print(r)
