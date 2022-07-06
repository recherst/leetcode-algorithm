/**
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

  

 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Example 2:
 Input: nums = [0]
 Output: [0]
  

 Constraints:
 - 1 <= nums.length <= 104
 - -231 <= nums[i] <= 231 - 1
  

 Follow up: Could you minimize the total number of operations done?
 */
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count > 1 {
            var deleteCount = 0
            for i in 0..<nums.count {
                if i - deleteCount < nums.count && nums[i - deleteCount] == 0 {
                    nums.remove(at: i - deleteCount)
                    deleteCount += 1
                }
            }
            for _ in 0..<deleteCount {
                nums.append(0)
            }
        }
    }
}

let s = Solution()
var nums = [0, 0, 1]//[0,1,0,3,12]// // [0,0,0,0,0,0,1,1,1]
s.moveZeroes(&nums)
print(nums)
