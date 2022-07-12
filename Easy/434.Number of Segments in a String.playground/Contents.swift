/**
 Given a string s, return the number of segments in the string.

 A segment is defined to be a contiguous sequence of non-space characters.

  

 Example 1:
 Input: s = "Hello, my name is John"
 Output: 5
 Explanation: The five segments are ["Hello,", "my", "name", "is", "John"]
 
 Example 2:
 Input: s = "Hello"
 Output: 1
  

 Constraints:
 - 0 <= s.length <= 300
 - s consists of lowercase and uppercase English letters, digits, or one of the following characters "!@#$%^&*()_+-=',.:".
 - The only space character in s is ' '.
 */
class Solution {
    func countSegments(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var start = 0
        var end = 0
        var count = 0
        for c in s {
            if c != " " {
                end += 1
            } else {
                if end > start {
                    count += 1
                    start = 0
                    end = 0
                }
            }
        }
        if end > start {
            count += 1
        }
        return count
    }
}

let s = Solution()
let r = s.countSegments("                     ")
print(r)
