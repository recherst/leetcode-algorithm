/**
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 
 Example 2:
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 
 Example 3:
 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:
 - 1 <= s.length <= 1000
 - s consists of English letters (lower-case and upper-case), ',' and '.'.
 - 1 <= numRows <= 1000
 */
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }
        var matrix: [[Character]] = Array(repeating: Array(), count: numRows)
        
        for (i, e) in s.enumerated() {
            let remiander = i % (numRows - 1)
            let quotient = i / (numRows - 1)
            if quotient % 2 == 0 {
                matrix[remiander].append(e)
            } else {
                matrix[numRows - 1 - remiander].append(e)
            }
        }
        
        var res = ""
        for arr in matrix {
            for e in arr {
                res.append(e)
            }
        }
        return res
    }
}

let s = Solution()
let r = s.convert("PAYPALISHIRING", 4)
print(r)
