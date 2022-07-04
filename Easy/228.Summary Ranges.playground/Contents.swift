/**
 You are given a sorted unique integer array nums.

 A range [a,b] is the set of all integers from a to b (inclusive).

 Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.

 Each range [a,b] in the list should be output as:

 "a->b" if a != b
 "a" if a == b
  

 Example 1:
 Input: nums = [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: The ranges are:
 [0,2] --> "0->2"
 [4,5] --> "4->5"
 [7,7] --> "7"
 
 Example 2:
 Input: nums = [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: The ranges are:
 [0,0] --> "0"
 [2,4] --> "2->4"
 [6,6] --> "6"
 [8,9] --> "8->9"
  

 Constraints:
 - 0 <= nums.length <= 20
 - -231 <= nums[i] <= 231 - 1
 - All the values of nums are unique.
 - nums is sorted in ascending order.
 */

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else { return [] }
        var resultArr = [[nums[0]]]
        for (i, e) in nums.enumerated() {
            if i > 0 {
                if e - nums[i - 1] == 1 {
                    var lastArr = resultArr.popLast()!
                    lastArr.append(e)
                    resultArr.append(lastArr)
                } else {
                    resultArr.append([e])
                }
             }
        }
//        var result = [String]()
//        for e in resultArr {
//            if e.count > 1 {
//                result.append("\(e.first!)->\(e.last!)")
//            } else {
//                result.append("\(e.first!)")
//            }
//        }
        return resultArr.map { e -> String in
            if e.count > 1 {
                return "\(e.first!)->\(e.last!)"
            } else {
                return "\(e.first!)"
            }
        }
    }
}

let s = Solution()
let r = s.summaryRanges([0,1,2,4,5,7])
print(r)
