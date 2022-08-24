/**
 The count-and-say sequence is a sequence of digit strings defined by the recursive formula:

 countAndSay(1) = "1"
 countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
 To determine how you "say" a digit string, split it into the minimal number of substrings such that each substring contains exactly one unique digit. Then for each substring, say the number of digits, then say the digit. Finally, concatenate every said digit.

 For example, the saying and conversion for digit string "3322251":


 Given a positive integer n, return the nth term of the count-and-say sequence.

  

 Example 1:
 Input: n = 1
 Output: "1"
 Explanation: This is the base case.
 
 Example 2:
 Input: n = 4
 Output: "1211"
 Explanation:
 countAndSay(1) = "1"
 countAndSay(2) = say "1" = one 1 = "11"
 countAndSay(3) = say "11" = two 1's = "21"
 countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"
  

 Constraints:
 - 1 <= n <= 30
 */
class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        var sumArr = ["1"]
        var count = 0
        var number = Character("1")
        for i in 0..<n {
            if i > 0 {
                let preElement = sumArr[i - 1]
                var element = ""
                for (i, c) in preElement.enumerated() {
                    if i == 0 {
                        number = c
                        count += 1
                    } else {
                        let preCharacter = preElement[preElement.index(preElement.startIndex, offsetBy: i - 1)]
                        if preCharacter == c {
                            count += 1
                        } else {
                            element.append("\(count)\(number)")
                            number = c
                            count = 1
                        }
                    }
                    if i == preElement.count - 1 {
                        element.append("\(count)\(number)")
                    }
                }
                count = 0
                sumArr.append(element)
            }
        }
        return sumArr.last!
    }
}

let s = Solution()
let r = s.countAndSay(30)
print(r)
