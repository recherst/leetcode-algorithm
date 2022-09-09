/**
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

  
 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
  

 Constraints:
 - 1 <= s.length <= 2 * 10^5
 - s consists only of printable ASCII characters.
 */
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var newStr = ""
        for c in s {
            if ("a"..."z").contains(c.lowercased()) {
                newStr.append(c.lowercased())
            } else if ("0"..."9").contains(c) {
                newStr.append(c)
            }
        }
        guard !newStr.isEmpty else { return true }
        let preStr = String(newStr.prefix(newStr.count / 2))
        let sufStr = String(newStr.suffix(newStr.count / 2))
        return String(preStr.reversed()) == sufStr
    }
}

let s = Solution()
let r = s.isPalindrome("0P")
print(r)

