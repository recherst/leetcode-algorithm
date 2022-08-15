/**
 We define the usage of capitals in a word to be right when one of the following cases holds:

 - All letters in this word are capitals, like "USA".
 - All letters in this word are not capitals, like "leetcode".
 - Only the first letter in this word is capital, like "Google".
 
 Given a string word, return true if the usage of capitals in it is right.

  

 Example 1:
 Input: word = "USA"
 Output: true
 
 Example 2:
 Input: word = "FlaG"
 Output: false
  

 Constraints:
 - 1 <= word.length <= 100
 - word consists of lowercase and uppercase English letters.
 */
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        for (i, c) in word.enumerated() {
            if i > 0 {
                if Character(extendedGraphemeClusterLiteral: c).isUppercase {
                    let preCharacter = word[word.index(word.startIndex, offsetBy: i - 1)]
                    if preCharacter.isLowercase {
                        return false
                    }
                } else {
                    if i > 1 {
                        let preCharacter = word[word.index(word.startIndex, offsetBy: i - 1)]
                        if preCharacter.isUppercase {
                            return false
                        }
                    } else {
                        if Character(extendedGraphemeClusterLiteral: c).isUppercase {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
}

let s = Solution()
let r = s.detectCapitalUse("HggaG")
print(r)
