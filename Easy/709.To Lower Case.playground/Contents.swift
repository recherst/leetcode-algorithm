/**
 Given a string s, return the string after replacing every uppercase letter with the same lowercase letter.

  

 Example 1:
 Input: s = "Hello"
 Output: "hello"
 
 Example 2:
 Input: s = "here"
 Output: "here"
 
 Example 3:
 Input: s = "LOVELY"
 Output: "lovely"
  

 Constraints:
 - 1 <= s.length <= 100
 - s consists of printable ASCII characters.
 */
class Solution {
    func toLowerCase(_ s: String) -> String {
        var result = ""
        for c in s {
            if c.isUppercase {
                result.append(c.lowercased())
            } else {
                result.append(c)
            }
        }
        return result
    }
}

let s = Solution()
let r = s.toLowerCase("LOVELY")
print(r)
