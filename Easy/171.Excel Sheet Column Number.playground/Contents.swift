/**
 Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.

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
 Input: columnTitle = "A"
 Output: 1
 
 Example 2:
 Input: columnTitle = "AB"
 Output: 28
 
 Example 3:
 Input: columnTitle = "ZY"
 Output: 701
  

 Constraints:
 - 1 <= columnTitle.length <= 7
 - columnTitle consists only of uppercase English letters.
 - columnTitle is in the range ["A", "FXSHRXW"].
 */

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        let sample = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
        
        guard columnTitle.count > 1 else { return sample[columnTitle]! }
        var total = 0
        for (index, e) in columnTitle.reversed().enumerated() {
            if index == 0 {
                total += sample["\(e)"]!
            } else {
                total += (sample["\(e)"]! - 1) * pow(26, power: index)
            }
        }
        total += sum(26, power: columnTitle.count - 1)
        return total
    }
    
    private func sum(_ base: Int, power: Int) -> Int {
        guard power > 0 else { return 0 }
        var r = 0
        for i in 1...power {
            r += pow(base, power: i)
        }
        return r
    }
    
    private func pow(_ base: Int, power: Int) -> Int {
        guard power > 0 else { return 0 }
        var r = base
        for _ in 1..<power {
            r *= base
        }
        return r
    }
}
let s = Solution()
let r = s.titleToNumber("ZZY")
print(r)
