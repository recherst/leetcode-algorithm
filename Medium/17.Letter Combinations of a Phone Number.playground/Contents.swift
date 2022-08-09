/**
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.


  

 Example 1:
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
 Example 2:
 Input: digits = ""
 Output: []
 
 Example 3:
 Input: digits = "2"
 Output: ["a","b","c"]
  

 Constraints:
 - 0 <= digits.length <= 4
 - digits[i] is a digit in the range ['2', '9'].
 */
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        let num2LettersMap: [Character: [String]] = ["2": ["a", "b", "c"], "3": ["d", "e", "f"], "4": ["g", "h", "i"], "5": ["j", "k", "l"], "6": ["m", "n", "o"], "7": ["p", "q", "r", "s"], "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"]]
        
        var result = [String]()
        if digits.count == 1 {
            let letters = num2LettersMap[digits[digits.startIndex]]!
            for letter in letters {
                result.append(letter)
            }
        } else if digits.count == 2 {
            let letters1 = num2LettersMap[digits[digits.startIndex]]!
            let letters2 = num2LettersMap[digits[digits.index(digits.startIndex, offsetBy: 1)]]!
            for l1 in letters1 {
                for l2 in letters2 {
                    result.append("\(l1)\(l2)")
                }
            }
        } else if digits.count == 3 {
            let letters1 = num2LettersMap[digits[digits.startIndex]]!
            let letters2 = num2LettersMap[digits[digits.index(digits.startIndex, offsetBy: 1)]]!
            let letters3 = num2LettersMap[digits[digits.index(digits.startIndex, offsetBy: 2)]]!
            for l1 in letters1 {
                for l2 in letters2 {
                    for l3 in letters3 {
                        result.append("\(l1)\(l2)\(l3)")
                    }
                }
            }
        } else if digits.count == 4 {
            let letters1 = num2LettersMap[digits[digits.startIndex]]!
            let letters2 = num2LettersMap[digits[digits.index(digits.startIndex, offsetBy: 1)]]!
            let letters3 = num2LettersMap[digits[digits.index(digits.startIndex, offsetBy: 2)]]!
            let letters4 = num2LettersMap[digits[digits.index(digits.startIndex, offsetBy: 3)]]!
            for l1 in letters1 {
                for l2 in letters2 {
                    for l3 in letters3 {
                        for l4 in letters4 {
                            result.append("\(l1)\(l2)\(l3)\(l4)")
                        }
                    }
                }
            }
        }
        
        return result
    }
}

let s = Solution()
let r = s.letterCombinations("234")
print(r)
