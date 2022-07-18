/**
 Given a binary array nums, return the maximum number of consecutive 1's in the array.

  

 Example 1:
 Input: nums = [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
 
 Example 2:
 Input: nums = [1,0,1,1,0,1]
 Output: 2
  

 Constraints:
 - 1 <= nums.length <= 105
 - nums[i] is either 0 or 1.
 */
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var max = 0
        var current = 0
        for e in nums {
            if e == 1 {
                current += 1
            } else {
                if current > max {
                    max = current
                }
                current = 0
            }
        }
        return max > current ? max : current
    }
}

let s = Solution()
let r = s.findMaxConsecutiveOnes([1,1,0,1,1,0,0,1,0,1,1,1,1])
print(r)
