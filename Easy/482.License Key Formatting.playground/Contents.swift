/**
 You are given a license key represented as a string s that consists of only alphanumeric characters and dashes. The string is separated into n + 1 groups by n dashes. You are also given an integer k.

 We want to reformat the string s such that each group contains exactly k characters, except for the first group, which could be shorter than k but still must contain at least one character. Furthermore, there must be a dash inserted between two groups, and you should convert all lowercase letters to uppercase.

 Return the reformatted license key.

  

 Example 1:
 Input: s = "5F3Z-2e-9-w", k = 4
 Output: "5F3Z-2E9W"
 Explanation: The string s has been split into two parts, each part has 4 characters.
 Note that the two extra dashes are not needed and can be removed.
 
 Example 2:
 Input: s = "2-5g-3-J", k = 2
 Output: "2-5G-3J"
 Explanation: The string s has been split into three parts, each part has 2 characters except the first part as it could be shorter as mentioned above.
  

 Constraints:
 - 1 <= s.length <= 105
 - s consists of English letters, digits, and dashes '-'.
 - 1 <= k <= 104
 */
class Solution {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        let newStr = s.reversed()
        var delta = 0
        var res: String = ""
        for c in newStr {
            if c != "-" && delta < k {
                delta += 1
                if c.isLowercase {
                    res.append(c.uppercased())
                } else {
                    res.append(c)
                }
            } else if c != "-" && delta == k {
                res.append("-")
                if c.isLowercase {
                    res.append(c.uppercased())
                } else {
                    res.append(c)
                }
                delta = 1
            } else if c == "-" && delta == k {
                res.append(c)
                delta = 0
            }
        }
        if res.last == "-" {
            res = String(res.dropLast())
        }
        res = String(res.reversed())
        return res
    }
}

let s = Solution()
let r = s.licenseKeyFormatting("--a-a-a-a--", 2)
print(r)
