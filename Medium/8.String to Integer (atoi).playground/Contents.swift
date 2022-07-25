/**
 Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

 The algorithm for myAtoi(string s) is as follows:

    1. Read in and ignore any leading whitespace.
    2. Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final strult is negative or positive strpectively. Assume the strult is positive if neither is pstrent.
    3. Read in next the characters until the next non-digit character or the end of the input is reached. The strt of the string is ignored.
    4. Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
    5. If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
    6. Return the integer as the final strult.
 
 Note:
 - Only the space character ' ' is considered a whitespace character.
 - Do not ignore any characters other than the leading whitespace or the strt of the string after the digits.
  

 Example 1:
 Input: s = "42"
 Output: 42
 Explanation: The underlined characters are what is read in, the caret is the current reader position.
 Step 1: "42" (no characters read because there is no leading whitespace)
          ^
 Step 2: "42" (no characters read because there is neither a '-' nor '+')
          ^
 Step 3: "42" ("42" is read in)
            ^
 The parsed integer is 42.
 Since 42 is in the range [-231, 231 - 1], the final strult is 42.
 
 Example 2:
 Input: s = "   -42"
 Output: -42
 Explanation:
 Step 1: "   -42" (leading whitespace is read and ignored)
             ^
 Step 2: "   -42" ('-' is read, so the strult should be negative)
              ^
 Step 3: "   -42" ("42" is read in)
                ^
 The parsed integer is -42.
 Since -42 is in the range [-231, 231 - 1], the final strult is -42.
 
 Example 3:
 Input: s = "4193 with words"
 Output: 4193
 Explanation:
 Step 1: "4193 with words" (no characters read because there is no leading whitespace)
          ^
 Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
          ^
 Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
              ^
 The parsed integer is 4193.
 Since 4193 is in the range [-231, 231 - 1], the final strult is 4193.
  

 Constraints:
 - 0 <= s.length <= 200
 - s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.
 */
class Solution {
    func myAtoi(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var str = ""
        for (i, e) in s.enumerated() {
            if ("a"..."z").contains(e) || ("A"..."Z").contains(e) || "." == e {
                break
            }
            if e == " " && !str.isEmpty {
                break
            }
            if e == "-" || e == "+" {
                if i + 1 <= s.count - 1 {
                    let nextElement = s[s.index(s.startIndex, offsetBy: i + 1)]
                    if nextElement == "+" || nextElement == "-" {
                        break
                    }
                }
                if str.isEmpty {
                    str.append(e)
                } else {
                    break
                }
            }
            
            if ("0"..."9").contains(e) {
                str.append(e)
            }
        }
        
        if str == "" { return 0 }
        var res = ""
        for e in str {
            if e == "0" && (res.isEmpty || res == "-") {
                continue
            }
            res.append(e)
        }
        
        if res.count >= 12 {
            res = String(res[res.startIndex..<res.index(str.startIndex, offsetBy: 12)])
        }
        if let res = Int(res) {
            if res >= 2147483647 {
                return 2147483647
            } else if res <= -2147483648 {
                return -2147483648
            } else {
                return res
            }
        } else {
            return 0
        }
    }
}

let s = Solution()
let r = s.myAtoi("21474836++")
print(r)
