/**
 Given a string of English letters s, return the greatest English letter which occurs as both a lowercase and uppercase letter in s. The returned letter should be in uppercase. If no such letter exists, return an empty string.

 An English letter b is greater than another letter a if b appears after a in the English alphabet.

  

 Example 1:
 Input: s = "lEeTcOdE"
 Output: "E"
 Explanation:
 The letter 'E' is the only letter to appear in both lower and upper case.
 
 Example 2:
 Input: s = "arRAzFif"
 Output: "R"
 Explanation:
 The letter 'R' is the greatest letter to appear in both lower and upper case.
 Note that 'A' and 'F' also appear in both lower and upper case, but 'R' is greater than 'F' or 'A'.
 
 Example 3:
 Input: s = "AbCdEfGhIjK"
 Output: ""
 Explanation:
 There is no letter that appears in both lower and upper case.
  

 Constraints:
 - 1 <= s.length <= 1000
 - s consists of lowercase and uppercase English letters.
 */
class Solution {
    func greatestLetter(_ s: String) -> String {
        var upperCaseArr = [Character]()
        var lowerCaseArr = [Character]()
        for c in s {
            let s = "\(c)"
            if ("a"..."z").contains(s) {
                lowerCaseArr.append(c)
            } else if ("A"..."Z").contains(c) {
                upperCaseArr.append(c)
            }
        }
        
        var deplicateArr = [Character]()
        for c1 in upperCaseArr {
            for c2 in lowerCaseArr {
                if Character(c1.lowercased()) == c2 {
                    deplicateArr.append(c1)
                }
            }
        }
        guard !deplicateArr.isEmpty else { return "" }
        var maxAscii = deplicateArr.first!.asciiValue!
        var targetIndex = 0
        for (index, c) in deplicateArr.enumerated() {
            if c.asciiValue! > maxAscii {
                maxAscii = c.asciiValue!
                targetIndex = index
            }
        }
        return String(deplicateArr[targetIndex])
    }
}

let s = Solution()
let r = s.greatestLetter("AbCdEfGhIjK")
print(r)
