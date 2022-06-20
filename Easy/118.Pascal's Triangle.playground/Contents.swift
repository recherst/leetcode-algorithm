/**
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


  

 Example 1:
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 
 Example 2:
 Input: numRows = 1
 Output: [[1]]
  

 Constraints:
 - 1 <= numRows <= 30
 */
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var r = [[Int]]()
        for i in 1...numRows {
            if i == 1 {
                r.append([1])
            } else {
                var inner = [Int]()
                for j in 1...i {
                    let preLevelArr = r[i - 2]
                    if j == 1 {
                        inner.append(1)
                    } else {
                        if preLevelArr.count >= j {
                            let new = preLevelArr[j - 2] + preLevelArr[j - 1]
                            inner.append(new)
                        } else {
                            inner.append(preLevelArr[j - 2])
                        }
                    }
                }
                r.append(inner)
            }
        }
        return r
    }
}

let s = Solution()
let r = s.generate(5)
print(r)
