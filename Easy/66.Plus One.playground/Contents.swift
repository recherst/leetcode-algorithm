/**
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

 Increment the large integer by one and return the resulting array of digits.

  

 Example 1:
 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 
 Example 2:
 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 
 Example 3:
 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
  

 Constraints:
 - 1 <= digits.length <= 100
 - 0 <= digits[i] <= 9
 - digits does not contain any leading 0's.
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        guard !digits.isEmpty else { return [] }
        var carryFlag = 0
        var newIntArr = [Int]()
        for (index, var c) in digits.reversed().enumerated() {
            if c == 9 {
                if index == carryFlag {
                    carryFlag += 1
                    newIntArr.append(0)
                } else {
                    newIntArr.append(9)
                }
            } else {
                if index == carryFlag {
                    c += 1
                }
                newIntArr.append(c)
            }
        }
        if carryFlag == digits.count {
            newIntArr.append(1)
        }
        newIntArr = newIntArr.reversed()
        return newIntArr
    }
}

let s = Solution()
let r = s.plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])
print(r)
