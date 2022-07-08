/**
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both cases.

  

 Example 1:
 Input: s = "hello"
 Output: "holle"
 
 Example 2:
 Input: s = "leetcode"
 Output: "leotcede"
  

 Constraints:
 - 1 <= s.length <= 3 * 105
 - s consist of printable ASCII characters.
 */
class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowelArr: [String] = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]
        var left = 0
        var right = s.count - 1
        var sArr: [String] = s.map { String($0) }
        while left < right {
            if vowelArr.contains(sArr[left]) && vowelArr.contains(sArr[right]) {
                let temp = sArr[left]
                sArr[left] = sArr[right]
                sArr[right] = temp
                left += 1
                right -= 1
            } else if vowelArr.contains(sArr[left]) && !vowelArr.contains(sArr[right]) {
                right -= 1
            } else if !vowelArr.contains(sArr[left]) && vowelArr.contains(sArr[right]) {
                left += 1
            } else {
                left += 1
                right -= 1
            }
        }
        return "\(sArr.joined())"
    }
}

let s = Solution()
let r = s.reverseVowels("aA")
print(r == "Aa")
