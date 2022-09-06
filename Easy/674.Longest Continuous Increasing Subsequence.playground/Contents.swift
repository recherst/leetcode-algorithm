/**
 Given an unsorted array of integers nums, return the length of the longest continuous increasing subsequence (i.e. subarray). The subsequence must be strictly increasing.

 A continuous increasing subsequence is defined by two indices l and r (l < r) such that it is [nums[l], nums[l + 1], ..., nums[r - 1], nums[r]] and for each l <= i < r, nums[i] < nums[i + 1].

  

 Example 1:
 Input: nums = [1,3,5,4,7]
 Output: 3
 Explanation: The longest continuous increasing subsequence is [1,3,5] with length 3.
 Even though [1,3,5,7] is an increasing subsequence, it is not continuous as elements 5 and 7 are separated by element
 4.
 
 Example 2:
 Input: nums = [2,2,2,2,2]
 Output: 1
 Explanation: The longest continuous increasing subsequence is [2] with length 1. Note that it must be strictly
 increasing.
  

 Constraints:
 - 1 <= nums.length <= 10^4
 - -109 <= nums[i] <= 10^9
 */
class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var i = 0
        var max = 0
        var current = 0
        while i < nums.count - 1 {
            for j in i..<nums.count - 1 {
                if nums[j] < nums[j + 1] {
                    current += 1
                } else {
                    if current > max {
                        max = current
                    }
                    break
                }
            }
            i += (current > 0 ? current : 1)
            if current > max {
                max = current
            }
            current = 0
        }
        if current > max {
            max = current
        }
        return max + 1
    }
}

let s = Solution()
let r = s.findLengthOfLCIS([2,2,2,2,2])
print(r)

