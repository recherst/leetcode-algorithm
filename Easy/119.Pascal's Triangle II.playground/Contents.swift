/**
 Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:



 Example 1:
 Input: rowIndex = 3
 Output: [1,3,3,1]
 
 Example 2:
 Input: rowIndex = 0
 Output: [1]
 
 Example 3:
 Input: rowIndex = 1
 Output: [1,1]
  

 Constraints:
 - 0 <= rowIndex <= 33
  

 Follow up: Could you optimize your algorithm to use only O(rowIndex) extra space?
 */
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [[Int]]()
        for i in 0...rowIndex {
            if i == 0 {
                result.append([1])
            } else {
                var innerArr = [Int]()
                for j in 0...i {
                    if j == 0 {
                        innerArr.append(1)
                    } else {
                        let preLevel = result[i - 1]
                        if preLevel.count > j {
                            innerArr.append(preLevel[j - 1] + preLevel[j])
                        } else {
                            innerArr.append(preLevel[j - 1])
                        }
                    }
                }
                result.append(innerArr)
            }
        }
        return result.popLast()!
    }
}

let s = Solution()
let r = s.getRow(2)
print(r)
