/**
 Given a binary string s, return the number of non-empty substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively.

 Substrings that occur multiple times are counted the number of times they occur.

  

 Example 1:
 Input: s = "00110011"
 Output: 6
 Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
 Notice that some of these substrings repeat and are counted the number of times they occur.
 Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.
 
 Example 2:
 Input: s = "10101"
 Output: 4
 Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.
  

 Constraints:
 - 1 <= s.length <= 105
 - s[i] is either '0' or '1'.
 */
class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var arr = [String(s.first!)]
        for (i, c) in s.enumerated() {
            if i > 0 {
                let character = arr.last!.last!
                if c == character {
                    var element = arr.popLast()!
                    element.append("\(c)")
                    arr.append(element)
                } else {
                    arr.append("\(c)")
                }
            }
        }
        
        var totalCount = 0
        for (i, e) in arr.enumerated() {
            if i < arr.count - 1 {
                let lastElement = arr[i + 1]
                totalCount += e.count >= lastElement.count ? lastElement.count : e.count
            }
        }
        return totalCount
    }
}

let s = Solution()
let r = s.countBinarySubstrings("11110011")
print(r)
