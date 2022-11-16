/**
 Your friend is typing his name into a keyboard. Sometimes, when typing a character c, the key might get long pressed, and the character will be typed 1 or more times.

 You examine the typed characters of the keyboard. Return True if it is possible that it was your friends name, with some characters (possibly none) being long pressed.

  

 Example 1:
 Input: name = "alex", typed = "aaleex"
 Output: true
 Explanation: 'a' and 'e' in 'alex' were long pressed.
 
 Example 2:
 Input: name = "saeed", typed = "ssaaedd"
 Output: false
 Explanation: 'e' must have been pressed twice, but it was not in the typed output.
  

 Constraints:
 - 1 <= name.length, typed.length <= 1000
 - name and typed consist of only lowercase English letters.
 */
class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var nameArr = [String(name.first!)]
        for (i, c) in name.enumerated() {
            if i > 0 {
                var character = nameArr.last!.last
                if character == c {
                    var last = nameArr.popLast()!
                    last.append(c)
                    nameArr.append(last)
                } else {
                    nameArr.append(String(c))
                }
            }
        }
        
        var typedArr = [String(typed.first!)]
        for (i, c) in typed.enumerated() {
            if i > 0 {
                var character = typedArr.last!.last
                if character == c {
                    var last = typedArr.popLast()!
                    last.append(c)
                    typedArr.append(last)
                } else {
                    typedArr.append(String(c))
                }
            }
        }
        
        if nameArr.count != typedArr.count {
            return false
        }
        for (i, e) in nameArr.enumerated() {
            let element = typedArr[i]
            if e.first != element.first {
                return false
            } else {
                if e.count > element.count {
                    return false
                }
            }
        }
        return true
    }
}

let s = Solution()
let r = s.isLongPressedName("leelee", "lleeelee")
print(r)
