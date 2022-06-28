/**
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

  

 Example 1:
 Input: nums = [1,2,3,1]
 Output: true
 
 Example 2:
 Input: nums = [1,2,3,4]
 Output: false
 
 Example 3:
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
  

 Constraints:
 - 1 <= nums.length <= 105
 - -109 <= nums[i] <= 109
 */
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [nums[0]: 1]
        var newArr = nums
        newArr.remove(at: 0)
        for e in newArr {
            if map[e] != nil {
                return true
            } else {
                map[e] = 1
            }
        }
        return false
    }
}
