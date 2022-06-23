/**
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  

 Example 1:
 Input: nums = [3,2,3]
 Output: 3
 
 Example 2:
 Input: nums = [2,2,1,1,1,2,2]
 Output: 2
  

 Constraints:
 - n == nums.length
 - 1 <= n <= 5 * 104
 - -109 <= nums[i] <= 109
  

 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        var newNums = nums
        map[nums[0]] = 1
        newNums.remove(at: 0)
        for e in newNums {
            if var count = map[e] {
                count += 1
                map[e] = count
            } else {
                map[e] = 1
            }
        }
        var targetKey = 0
        for (key, value) in map {
            if value > nums.count / 2 {
                targetKey = key
            }
        }
        return targetKey
    }
}

let s = Solution()
let r = s.majorityElement([3, 2, 3])
print(r)
