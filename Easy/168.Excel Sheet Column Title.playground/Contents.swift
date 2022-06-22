/**
 Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  

 Example 1:
 Input: columnNumber = 1
 Output: "A"
 
 Example 2:
 Input: columnNumber = 28
 Output: "AB"
 
 Example 3:
 Input: columnNumber = 701
 Output: "ZY"
  

 Constraints:
 - 1 <= columnNumber <= 231 - 1
 */
class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        let sample = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H", 9: "I", 10: "J", 11: "K", 12: "L", 13: "M", 14: "N", 15: "O", 16: "P", 17: "Q", 18: "R", 19: "S", 20: "T", 21: "U", 22: "V", 23: "W", 24: "X", 25: "Y", 26: "Z"]
        var n: Int = 0
        while sum(26, n) < columnNumber {
            n += 1
        }
        
        if n == 1 {
            return sample[columnNumber]!
        } else {
            let delta = columnNumber - sum(26, n - 1)
            var resultArr = [[Int]]()
            var byDivider = delta
            while n > 1 {
                let quotient = byDivider / pow(26, n - 1)
                let remainder = delta % pow(26, n - 1)
                byDivider = remainder
                resultArr.append([quotient, remainder])
                n -= 1
            }
            var s = ""
            for (index, e) in resultArr.enumerated() {
                let quotient  = e[0]
                let remainder = e[1]
                if remainder != 0 {
                    s.append(sample[quotient + 1]!)
                } else {
                    s.append(sample[quotient]!)
                }
                
                if index == resultArr.count - 1 {
                    if remainder != 0 {
                        s.append(sample[remainder]!)
                    } else {
                        s.append("Z")
                    }
                }
            }
            return s
        }
    }
    
    private func pow(_ base: Int, _ power: Int) -> Int {
        var r = 1
        for _ in 0..<power {
            r *= base
        }
        return r
    }
    
    
    private func sum(_ base: Int, _ power: Int) -> Int {
        guard power >= 1 else { return 0 }
        var r = 0
        for i in 1...power {
            r += pow(base, i)
        }
        return r
    }
}

let s = Solution()
let r = s.convertToTitle(5716)
print(r)
